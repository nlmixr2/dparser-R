# Return the dparser function pointers

Return the dparser function pointers

## Usage

``` r
.dparsePtr()
```

## Value

dparser function pointers

## Author

Matthew L. Fidler

## Examples

``` r
.dparsePtr()
#> $dparse___freeP
#> <pointer: 0x7a4c9173b470>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7a4c9173b4f0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7a4c91725550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7a4c91725540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7a4c91725520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7a4c91725500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7a4c917254e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7a4c917254c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7a4c91725530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7a4c91725510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7a4c917254f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7a4c917254d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7a4c917254b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7a4c91746330>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7a4c917462f0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7a4c917462b0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7a4c91746270>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7a4c9173d420>
#> 
#> $dparse_escape_string
#> <pointer: 0x7a4c9173d410>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7a4c9173d390>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7a4c9173d320>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7a4c9173d290>
#> 
#> $dparse_d_free
#> <pointer: 0x7a4c9173d430>
#> 
#> $dparse_strhashl
#> <pointer: 0x7a4c9173c6c0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7a4c9173c600>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7a4c9173c890>
#> 
#> $dparse_buf_read
#> <pointer: 0x7a4c9173c740>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7a4c9173d1d0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7a4c9173cfb0>
#> 
#> $dparse_set_union
#> <pointer: 0x7a4c9173cde0>
#> 
#> $dparse_set_add
#> <pointer: 0x7a4c9173ce50>
#> 
#> $dparse_set_find
#> <pointer: 0x7a4c9173cd90>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7a4c9173cc90>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7a4c9173cb50>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7a4c9173bb80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7a4c9173bb60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7a4c9173bb40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7a4c9173bb20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7a4c9173bac0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7a4c9173a720>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7a4c91734270>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7a4c91734260>
#> 
#> $dparse_free_Action
#> <pointer: 0x7a4c917336c0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7a4c91733730>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7a4c917336a0>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7a4c91733700>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7a4c91733790>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7a4c91731620>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7a4c9172c820>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7a4c9172be50>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7a4c9172bc70>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7a4c9172b790>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7a4c9172b340>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7a4c9172b110>
#> 
#> $dparse_find_pass
#> <pointer: 0x7a4c9172a9e0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7a4c9172abd0>
#> 
#> $dparse_add_pass
#> <pointer: 0x7a4c9172aab0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7a4c9172a8b0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7a4c9172a6b0>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7a4c9172af70>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7a4c9172a730>
#> 
#> $dparse_new_code
#> <pointer: 0x7a4c9172a690>
#> 
#> $dparse_new_token
#> <pointer: 0x7a4c9172a5d0>
#> 
#> $dparse_new_ident
#> <pointer: 0x7a4c9172a500>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7a4c9172a2e0>
#> 
#> $dparse_new_string
#> <pointer: 0x7a4c91729f50>
#> 
#> $dparse_new_production
#> <pointer: 0x7a4c9172aea0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7a4c9172a810>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7a4c917297c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7a4c91729760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7a4c9172ae30>
#> 
#> $dparse_print_term
#> <pointer: 0x7a4c9172be90>
#> 
#> $dparse_print_rule
#> <pointer: 0x7a4c9172c100>
#> 
#> $dparse_print_states
#> <pointer: 0x7a4c9172c470>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7a4c9172e6c0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7a4c9172c190>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7a4c9172d620>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7a4c9172d7a0>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7a4c9172ce70>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7a4c9172ce20>
#> 
#> $dparse_print_scope
#> <pointer: 0x7a4c917292f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7a4c91729110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7a4c91729090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7a4c91728e10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7a4c917291d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7a4c91729230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7a4c91729010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7a4c91728fb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7a4c91728d40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7a4c91728c10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7a4c91728bb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7a4c91728b90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7a4c91728a90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7a4c91728e50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7a4c91728b30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7a4c917289d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7a4c9173a5a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7a4c9173c650>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7a4c9173a630>
#> 
#> $dparse_d_pass
#> <pointer: 0x7a4c9173a740>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7a4c91737950>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7a4c91737930>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7a4c917378d0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7a4c91737870>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7a4c917378b0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7a4c9173a700>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7a4c9173aa20>
#> 
#> $dparse_dparse
#> <pointer: 0x7a4c9173af10>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7a4c9173a8e0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7a4c9173a810>
#> 
```
