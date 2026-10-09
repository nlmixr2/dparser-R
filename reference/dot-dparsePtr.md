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
#> <pointer: 0x7f98547b3640>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f98547b36c0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f985479e5a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f985479e590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f985479e570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f985479e550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f985479e530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f985479e510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f985479e580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f985479e560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f985479e540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f985479e520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f985479e500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f98547be240>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f98547be200>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f98547be1c0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f98547be180>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f98547b5510>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f98547b5500>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f98547b54a0>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f98547b5430>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f98547b53a0>
#> 
#> $dparse_d_free
#> <pointer: 0x7f98547b5520>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f98547b48b0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f98547b47e0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f98547b4a20>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f98547b4900>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f98547b52e0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f98547b50d0>
#> 
#> $dparse_set_union
#> <pointer: 0x7f98547b4f10>
#> 
#> $dparse_set_add
#> <pointer: 0x7f98547b4f80>
#> 
#> $dparse_set_find
#> <pointer: 0x7f98547b4ec0>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f98547b4dd0>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f98547b4cf0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f98547b3d80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f98547b3d60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f98547b3d40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f98547b3d20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f98547b3cc0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f98547b2920>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f98547acae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f98547acad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f98547abfb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f98547ac000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f98547abf90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f98547abfd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f98547ac050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f98547a9ff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f98547a5430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f98547a4ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f98547a48d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f98547a43e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f98547a3fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f98547a3d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f98547a3630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f98547a3800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f98547a36f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f98547a3510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f98547a3360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f98547a3bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f98547a33c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f98547a3340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f98547a3280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f98547a31b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f98547a2fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f98547a2c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f98547a3ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f98547a3470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f98547a24f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f98547a2490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f98547a3a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f98547a4af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f98547a4d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f98547a5090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f98547a71f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f98547a4dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f98547a6210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f98547a6380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f98547a5a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f98547a5a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f98547a20a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f98547a1ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f98547a1e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f98547a1bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f98547a1f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f98547a1ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f98547a1dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f98547a1d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f98547a1b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f98547a1a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f98547a19d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f98547a19b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f98547a18c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f98547a1c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f98547a1950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f98547a1800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f98547b27a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f98547b4840>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f98547b2840>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f98547b2940>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f98547aff20>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f98547aff00>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f98547afea0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f98547afe40>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f98547afe80>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f98547b2900>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f98547b2bd0>
#> 
#> $dparse_dparse
#> <pointer: 0x7f98547b3080>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f98547b2ac0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f98547b29e0>
#> 
```
