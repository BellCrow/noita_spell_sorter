import os
from argparse import ArgumentParser
import re

lua_identifier_regex = '[a-zA-Z_][a-zA-Z_0-9]+'

lua_whitespace_regex = '\\s+'
lua_type = lua_identifier_regex

class LuaDocType:
    def __init__(self, type_name:str):
        self.type_name:str = type_name

class LuaDocArgument:
    def __init__(self, name:str, type:list[str]):
        self.name:str = name
        self.type:list[str] = type

class LuaDocMethod:
    def __init__(self, function_name:str, return_value:LuaDocType, arguments:list[LuaDocArgument], description:str):
         self.function_name:str = function_name
         self.return_value:LuaDocType = return_value
         self.arguments:list[LuaDocArgument] = arguments
         self.description:str = description

def main():
#  parser = ArgumentParser()
#  _ = parser.add_argument("-i", "--input")
#  _ = parser.add_argument("-o", "--output")
#  _ = parser.add_argument("-f", "--force")

#  args = parser.parse_args()

    #CheckInputArgsAndPrepare(parser.input, parse.output, args.force)
    test_input = "EntityLoadToEntity( filename:string, entity:int ) [Loads components from 'filename' to 'entity'. Does not load tags and other stuff.]"
    _ = ParseLuaDocumentationString(test_input)

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

#EntityLoadToEntity( filename:string, entity:int ) [Loads components from 'filename' to 'entity'. Does not load tags and other stuff.]
def GetCommentText(line:str):
    regex = '^.*\[(.*)\]'
    
    
#EntityLoadToEntity( filename:string, entity:int ) [Loads components from 'filename' to 'entity'. Does not load tags and other stuff.]
def ParseLuaDocumentationString(documentation_line:str):
    match_object = re.search(get_comment_regex, documentation_line)
    assert(match_object is not None)
    comment_text = match_object.group(2)
    return None

lua_identifier_regex = '[a-zA-Z_][a-zA-Z_0-9]+'
lua_whitespace_regex = '\\s+'
lua_type = lua_identifier_regex

def GetMethodName(method_content:str) -> str:
    match_object = re.search(f"({lua_identifier_regex}).*$", method_content)
    assert(match_object is not None)
    return match_object.group(1)

def GetArguments(method_content:str) -> list[LuaDocArgument]:
    match_object = re.search(f"({lua_identifier_regex}).(.*)$", method_content)
    if(match_object is None):
        return []
    arguments_as_string = match_object.group(2).strip()
    individual_arguments = arguments_as_string.split(',')
    trimmed_arguments = filter(lambda argument: argument.strip(), individual_arguments )

    return trimmed_arguments

def ConvertLuaDocumentationFile(input_file:str, output_file:str):
    pass

if (__name__ == "__main__"):
    main()
