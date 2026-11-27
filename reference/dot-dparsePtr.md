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
#> <pointer: 0x7aae0b4aa3f0>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7aae0b4aa470>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7aae0b494550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7aae0b494540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7aae0b494520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7aae0b494500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7aae0b4944e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7aae0b4944c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7aae0b494530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7aae0b494510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7aae0b4944f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7aae0b4944d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7aae0b4944b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7aae0b4b52b0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7aae0b4b5270>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7aae0b4b5230>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7aae0b4b51f0>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7aae0b4ac3a0>
#> 
#> $dparse_escape_string
#> <pointer: 0x7aae0b4ac390>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7aae0b4ac310>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7aae0b4ac2a0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7aae0b4ac210>
#> 
#> $dparse_d_free
#> <pointer: 0x7aae0b4ac3b0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7aae0b4ab670>
#> 
#> $dparse_dup_str
#> <pointer: 0x7aae0b4ab5b0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7aae0b4ab810>
#> 
#> $dparse_buf_read
#> <pointer: 0x7aae0b4ab6c0>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7aae0b4ac150>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7aae0b4abf30>
#> 
#> $dparse_set_union
#> <pointer: 0x7aae0b4abd60>
#> 
#> $dparse_set_add
#> <pointer: 0x7aae0b4abdd0>
#> 
#> $dparse_set_find
#> <pointer: 0x7aae0b4abd10>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7aae0b4abc10>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7aae0b4abad0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7aae0b4aab00>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7aae0b4aaae0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7aae0b4aaac0>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7aae0b4aaaa0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7aae0b4aaa40>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7aae0b4a96a0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7aae0b4a31f0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7aae0b4a31e0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7aae0b4a2640>
#> 
#> $dparse_goto_State
#> <pointer: 0x7aae0b4a26b0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7aae0b4a2620>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7aae0b4a2680>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7aae0b4a2710>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7aae0b4a05d0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7aae0b49b7e0>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7aae0b49ae10>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7aae0b49ac30>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7aae0b49a750>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7aae0b49a300>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7aae0b49a0d0>
#> 
#> $dparse_find_pass
#> <pointer: 0x7aae0b4999a0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7aae0b499b90>
#> 
#> $dparse_add_pass
#> <pointer: 0x7aae0b499a70>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7aae0b499870>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7aae0b499670>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7aae0b499f30>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7aae0b4996f0>
#> 
#> $dparse_new_code
#> <pointer: 0x7aae0b499650>
#> 
#> $dparse_new_token
#> <pointer: 0x7aae0b499590>
#> 
#> $dparse_new_ident
#> <pointer: 0x7aae0b4994c0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7aae0b4992c0>
#> 
#> $dparse_new_string
#> <pointer: 0x7aae0b498f30>
#> 
#> $dparse_new_production
#> <pointer: 0x7aae0b499e60>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7aae0b4997d0>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7aae0b4987c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7aae0b498760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7aae0b499df0>
#> 
#> $dparse_print_term
#> <pointer: 0x7aae0b49ae50>
#> 
#> $dparse_print_rule
#> <pointer: 0x7aae0b49b0c0>
#> 
#> $dparse_print_states
#> <pointer: 0x7aae0b49b430>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7aae0b49d680>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7aae0b49b150>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7aae0b49c5e0>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7aae0b49c760>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7aae0b49be30>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7aae0b49bde0>
#> 
#> $dparse_print_scope
#> <pointer: 0x7aae0b4982f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7aae0b498110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7aae0b498090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7aae0b497e10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7aae0b4981d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7aae0b498230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7aae0b498010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7aae0b497fb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7aae0b497d40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7aae0b497c10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7aae0b497bb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7aae0b497b90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7aae0b497a90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7aae0b497e50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7aae0b497b30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7aae0b4979d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7aae0b4a9520>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7aae0b4ab600>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7aae0b4a95b0>
#> 
#> $dparse_d_pass
#> <pointer: 0x7aae0b4a96c0>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7aae0b4a68d0>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7aae0b4a68b0>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7aae0b4a6850>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7aae0b4a67f0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7aae0b4a6830>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7aae0b4a9680>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7aae0b4a99a0>
#> 
#> $dparse_dparse
#> <pointer: 0x7aae0b4a9e90>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7aae0b4a9860>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7aae0b4a9790>
#> 
```
