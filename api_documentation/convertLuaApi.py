import os
import re
from tree_sitter import Language, Node, Parser, Tree


PATH_TO_SO = "/home/peremptor/tree-sitter-parser/tree-sitter-noitadoc/noitadoc.so"


def get_parser() -> Parser:
    lang: Language = Language(PATH_TO_SO, "noitadoc")
    parser: Parser = Parser()
    parser.set_language(lang)
    return parser


def CheckInputArgsAndPrepare(input_file: str, output_file: str, force: bool) -> None:
    if not os.path.isfile(input_file):
        raise FileNotFoundError(input_file)
    output_file_exists = os.path.isfile(output_file)
    if output_file_exists and not force:
        raise Exception("Output file already exists use -f to overwrite it")
    if output_file_exists:
        os.remove(output_file)
    if not os.path.exists(output_file):
        os.makedirs(output_file)


def get_child_text_by_type(node: Node, type_name: str) -> str:
    return get_child_by_type(node, type_name).text.decode("utf-8").strip()


def has_child_by_type(node: Node, type_name: str) -> bool:
    return len(get_children_by_type(node, type_name)) >= 1


def get_child_by_type(node: Node, type_name: str) -> Node:
    children = get_children_by_type(node, type_name)
    assert len(children) == 1
    return children[0]


def get_children_by_type(node: Node, type_name: str) -> list[Node]:
    ret: list[Node] = []
    sub_nodes = node.children
    for sub_node in sub_nodes:
        if sub_node.type == type_name:
            ret.append(sub_node)
    return ret


def is_special_case_argument(argument_node: Node) -> bool:
    if len(get_children_by_type(argument_node, "identifier")) == 2:
        # is this case (weird args):
        # PolymorphTableGet( bool rare_table = false ) -> {string}....
        return True
    just_table_regex = re.compile("{.*}")
    if just_table_regex.fullmatch(argument_node.text.decode("utf-8")):
        return True
    return False


def fix_type(type_text: str) -> str:
    if type_text == "bool":
        # another special case where in the documentation the type
        # 'int' is used. luals only understands the type 'integer'
        type_text = "boolean"

    if type_text == "int" or type_text == "uint32":
        # another special case where in the documentation the type
        # 'int' is used. luals only understands the type 'integer'
        type_text = "integer"

    if type_text == "multiple_types":
        # seem to be the most fitting type, that luals undestands
        type_text = "any"

    if type_text == "float":
        # seem to be the most fitting type, that luals undestands
        type_text = "number"

    key_value_store_regex = re.compile("{(.*)-(.*)}")
    regex_match = key_value_store_regex.fullmatch(type_text)
    if regex_match:
        # this is a key value table in luals
        type_text = f"table<{regex_match.group(1)}, {regex_match.group(2)}>"

    just_table_regex = re.compile("{(.*)}")
    regex_match = just_table_regex.fullmatch(type_text)
    if regex_match:
        # I presume what is always meant by types like "{string}" is just an array
        type_text = f"{regex_match.group(1)}[]"
    return type_text


def get_argument_node_documentation(function_argument_node: Node) -> str:
    if is_special_case_argument(function_argument_node):
        return f'---{function_argument_node.text.decode("utf-8")}'

    ret = f"--- @param {get_child_text_by_type(function_argument_node, 'identifier')}"

    if has_child_by_type(function_argument_node, "function_argument_type"):
        argument_type = get_child_text_by_type(
            function_argument_node, "function_argument_type"
        )
        argument_type = fix_type(argument_type)
        ret += f" {argument_type}"

    if has_child_by_type(function_argument_node, "function_argument_default_value"):
        ret += " default value " + get_child_text_by_type(
            function_argument_node, "function_argument_default_value"
        )

    return ret


def create_function_documentation_string(funtion_argument_nodes: list[Node]):
    texts: list[str] = []
    for node in funtion_argument_nodes:
        texts.append(get_argument_node_documentation(node))
    return "\n".join(texts)


def get_function_name(node: Node) -> str:
    return get_child_text_by_type(node, "function_name")


def get_function_argument_string(node: Node) -> str:
    arg_nodes = get_children_by_type(node, "function_argument")
    texts: list[str] = []
    for node in arg_nodes:
        argument_name_node = node.children[0]
        texts.append(argument_name_node.text.decode("utf-8"))
    return ", ".join(texts)


def build_function(node: Node) -> str:
    function_name = get_function_name(node)
    return f"function {function_name}({get_function_argument_string(node)})end"


def create_return_documentation(return_node: Node) -> str:
    return_node_text = get_child_text_by_type(return_node, "return_type")
    # if the return value has a name it will look like this: 
    # <name>:<type>
    # we have to parse this now 
    if ':' in return_node_text:
        return_type_regex = re.compile('(.*):(.*)')
        match = return_type_regex.match(return_node_text)
        assert match is not None
        fixed_type = match.group(2)
        return f"--- @return {fixed_type} {match.group(1)}" 
    else:
        fixed_type = fix_type(return_node_text)
        return f"--- @return {fixed_type}" 

def convertLuaDocumentationLine(input: str) -> str:
    parser = get_parser()
    tree: Tree = parser.parse(str.encode(input))
    line_node = tree.root_node.child(0)

    if line_node == None:
        raise Exception("Test")
    assert line_node.type == "line"
    luadoc: list[str] = []
    luadoc.append(
        create_function_documentation_string(
            get_children_by_type(line_node, "function_argument")
        )
    )

    if has_child_by_type(line_node, "return_def"):
        luadoc.append(create_return_documentation(get_child_by_type(line_node, 'return_def')))

    function_documentation = "\n".join(luadoc)

    return function_documentation + "\n" + build_function(line_node)


def convert_lua_documentation_file(input_file: str, output_file: str) -> str:
    raw_documentation_lines = open(input_file).readlines()
    result = ""
    for line in raw_documentation_lines:
        result += convertLuaDocumentationLine(line) + os.linesep
    _ = open(output_file, "w").write(result)
    return result


if __name__ == "__main__":
    test = convert_lua_documentation_file(
        "/home/peremptor/repos/personal/noita_spell_sorter/api_documentation/raw/docs.noitadoc",
        "/home/peremptor/repos/personal/noita_spell_sorter/api_documentation/noita_lua_ls_documentation.lua",
    )
