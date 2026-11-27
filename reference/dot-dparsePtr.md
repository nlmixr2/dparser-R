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
#> <pointer: 0x7d8cec0e43f0>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7d8cec0e4470>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7d8cec0ce550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7d8cec0ce540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7d8cec0ce520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7d8cec0ce500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7d8cec0ce4e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7d8cec0ce4c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7d8cec0ce530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7d8cec0ce510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7d8cec0ce4f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7d8cec0ce4d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7d8cec0ce4b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7d8cec0ef2b0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7d8cec0ef270>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7d8cec0ef230>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7d8cec0ef1f0>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7d8cec0e63a0>
#> 
#> $dparse_escape_string
#> <pointer: 0x7d8cec0e6390>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7d8cec0e6310>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7d8cec0e62a0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7d8cec0e6210>
#> 
#> $dparse_d_free
#> <pointer: 0x7d8cec0e63b0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7d8cec0e5640>
#> 
#> $dparse_dup_str
#> <pointer: 0x7d8cec0e5580>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7d8cec0e5810>
#> 
#> $dparse_buf_read
#> <pointer: 0x7d8cec0e56c0>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7d8cec0e6150>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7d8cec0e5f30>
#> 
#> $dparse_set_union
#> <pointer: 0x7d8cec0e5d60>
#> 
#> $dparse_set_add
#> <pointer: 0x7d8cec0e5dd0>
#> 
#> $dparse_set_find
#> <pointer: 0x7d8cec0e5d10>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7d8cec0e5c10>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7d8cec0e5ad0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7d8cec0e4b00>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7d8cec0e4ae0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7d8cec0e4ac0>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7d8cec0e4aa0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7d8cec0e4a40>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7d8cec0e36a0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7d8cec0dd1f0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7d8cec0dd1e0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7d8cec0dc640>
#> 
#> $dparse_goto_State
#> <pointer: 0x7d8cec0dc6b0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7d8cec0dc620>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7d8cec0dc680>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7d8cec0dc710>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7d8cec0da5a0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7d8cec0d5820>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7d8cec0d4e50>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7d8cec0d4c70>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7d8cec0d4790>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7d8cec0d4340>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7d8cec0d4110>
#> 
#> $dparse_find_pass
#> <pointer: 0x7d8cec0d39e0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7d8cec0d3bd0>
#> 
#> $dparse_add_pass
#> <pointer: 0x7d8cec0d3ab0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7d8cec0d38b0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7d8cec0d36b0>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7d8cec0d3f70>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7d8cec0d3730>
#> 
#> $dparse_new_code
#> <pointer: 0x7d8cec0d3690>
#> 
#> $dparse_new_token
#> <pointer: 0x7d8cec0d35d0>
#> 
#> $dparse_new_ident
#> <pointer: 0x7d8cec0d3500>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7d8cec0d32e0>
#> 
#> $dparse_new_string
#> <pointer: 0x7d8cec0d2f40>
#> 
#> $dparse_new_production
#> <pointer: 0x7d8cec0d3ea0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7d8cec0d3810>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7d8cec0d27c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7d8cec0d2760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7d8cec0d3e30>
#> 
#> $dparse_print_term
#> <pointer: 0x7d8cec0d4e90>
#> 
#> $dparse_print_rule
#> <pointer: 0x7d8cec0d5100>
#> 
#> $dparse_print_states
#> <pointer: 0x7d8cec0d5470>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7d8cec0d76c0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7d8cec0d5190>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7d8cec0d6620>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7d8cec0d67a0>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7d8cec0d5e70>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7d8cec0d5e20>
#> 
#> $dparse_print_scope
#> <pointer: 0x7d8cec0d22f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7d8cec0d2110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7d8cec0d2090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7d8cec0d1e10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7d8cec0d21d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7d8cec0d2230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7d8cec0d2010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7d8cec0d1fb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7d8cec0d1d40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7d8cec0d1c10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7d8cec0d1bb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7d8cec0d1b90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7d8cec0d1a90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7d8cec0d1e50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7d8cec0d1b30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7d8cec0d19d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7d8cec0e3520>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7d8cec0e55d0>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7d8cec0e35b0>
#> 
#> $dparse_d_pass
#> <pointer: 0x7d8cec0e36c0>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7d8cec0e08d0>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7d8cec0e08b0>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7d8cec0e0850>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7d8cec0e07f0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7d8cec0e0830>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7d8cec0e3680>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7d8cec0e39a0>
#> 
#> $dparse_dparse
#> <pointer: 0x7d8cec0e3e90>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7d8cec0e3860>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7d8cec0e3790>
#> 
```
