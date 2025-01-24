from __future__ import annotations
from enum import Enum
import re

class ParserContext():
    def __init__(self, parser_line:str) -> None:
        self.parser_line:str = parser_line
        self.parser_position:int = 0
        self.is_done:bool = len(self.parser_line) == self.parser_position
    def IsDone(self)->bool:
        return len(self.parser_line) == self.parser_position

    def __throwIfDone(self):
        if self.IsDone():
            raise Exception('No more charaters to parse !')

    def Peek(self)->str:
        self.__throwIfDone()
        return self.parser_line[self.parser_position]

    def Consume(self)->str:
        self.__throwIfDone()
        ret_value = self.Peek()
        self.parser_position = self.parser_position + 1
        return ret_value

class AstTokenType(Enum):
    LINE = 1
    RETURN = 2
    METHOD_NAME = 3
    IDENTIFIER = 4

class AstNode():
    def __init__(self, content:str, token_type:AstTokenType, children:list[AstNode]) -> None:
        self.content:str = content
        self.token_type:AstTokenType = token_type
        self.children:list[AstNode] = children

class PrimitiveParser():
    __IdentifierStartRegex:str = '[A-Za-z]'
    __IdentifierRegex:str = '[A-Za-z0-9]'
    def __init__(self, to_parse:str) -> None:
        self.parse_context:ParserContext = ParserContext(to_parse.replace(' ',''))
    def __matches(self, regex:str, character:str)->bool:
        regex_match = re.search(regex,character)
        return regex_match != None
    def ParseIdentifier(self) -> AstNode:
        so_far_parsed = ''
        character_to_be_parsed :str = self.parse_context.Consume()
        if not self.__matches(self.__IdentifierStartRegex, character_to_be_parsed):
            raise Exception(f'Tried to start parsing identifier at colunn {self.parse_context.parser_position} found char {character_to_be_parsed}')
        so_far_parsed = so_far_parsed + character_to_be_parsed

        while not self.parse_context.IsDone():
            if self.__matches(self.__IdentifierRegex, self.parse_context.Peek()):
                character_to_be_parsed = self.parse_context.Consume()
                so_far_parsed = so_far_parsed + character_to_be_parsed
            else:
                break
        return AstNode(so_far_parsed, AstTokenType.IDENTIFIER, [])

#EntityGetAllChildren( entity_id:int, tag:string = "" ) -> {entity_id:int}|nil [If passed the optional 'tag' parameter, will return only child entities that have that tag (If 'tag' isn't a valid tag name, will return no entities). If no entities are returned, might return either an empty table or nil.]
#GameOnComplted()
#GameGiveAchievement( id:string )
#GameDoEnding2()
#GetParallelWorldPosition( world_pos_x:number, world_pos_y:number ) -> x, y [x = 0 normal world, -1 is first west world, +1 is first east world, if y < 0 it is sky, if y > 0 it is hell ]
    def ParseType(self):





    def ConsumeWhiteSpace(self):
        __WhiteSpaceRegex = r'\s'
        peek_value = self.parse_context.Peek()
        while self.__matches(__WhiteSpaceRegex, peek_value):
            _ = self.parse_context.Consume()

def main():
    test = 'GameOnComplted()'
    parser = PrimitiveParser(test)
    parser.ConsumeWhiteSpace()
    ast = parser.ParseIdentifier()
    print(ast)


if (__name__ == "__main__"):
    main()




