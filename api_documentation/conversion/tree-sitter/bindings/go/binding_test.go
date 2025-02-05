package tree_sitter_noita_lua_doc_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_noita_lua_doc "github.com/tree-sitter/tree-sitter-noita_lua_doc/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_noita_lua_doc.Language())
	if language == nil {
		t.Errorf("Error loading NoitaLuaDoc grammar")
	}
}
