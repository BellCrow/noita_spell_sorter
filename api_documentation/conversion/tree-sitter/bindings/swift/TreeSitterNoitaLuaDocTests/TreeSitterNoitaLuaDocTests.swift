import XCTest
import SwiftTreeSitter
import TreeSitterNoitaLuaDoc

final class TreeSitterNoitaLuaDocTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_noita_lua_doc())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading NoitaLuaDoc grammar")
    }
}
