#include "runtime/parser.h"

typedef struct {
  Parser* parser;
  TSSymbol lookahead_symbol;
} SkipPrecedingTreesSession;

static void parser__push(Parser* self, StackVersion version, Tree* tree,
                         TSStateId state) {
  ts_stack_push(self->stack, version, tree, false, state);
  ts_tree_release(tree);
}

static Tree* parser__lex(Parser* self, StackVersion version) {
  TSStateId parse_state = ts_stack_top_state(self->stack, version);
  Length start_position = ts_stack_top_position(self->stack, version);
  TSLexMode lex_mode = self->language->lex_modes[parse_state];
}
