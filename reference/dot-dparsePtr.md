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
#> <pointer: 0x7f44b28e9640>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f44b28e96c0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f44b28d45a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f44b28d4590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f44b28d4570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f44b28d4550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f44b28d4530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f44b28d4510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f44b28d4580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f44b28d4560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f44b28d4540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f44b28d4520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f44b28d4500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f44b28f4240>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f44b28f4200>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f44b28f41c0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f44b28f4180>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f44b28eb510>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f44b28eb500>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f44b28eb4a0>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f44b28eb430>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f44b28eb3a0>
#> 
#> $dparse_d_free
#> <pointer: 0x7f44b28eb520>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f44b28ea8b0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f44b28ea7e0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f44b28eaa20>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f44b28ea900>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f44b28eb2e0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f44b28eb0d0>
#> 
#> $dparse_set_union
#> <pointer: 0x7f44b28eaf10>
#> 
#> $dparse_set_add
#> <pointer: 0x7f44b28eaf80>
#> 
#> $dparse_set_find
#> <pointer: 0x7f44b28eaec0>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f44b28eadd0>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f44b28eacf0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f44b28e9d80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f44b28e9d60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f44b28e9d40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f44b28e9d20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f44b28e9cc0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f44b28e8920>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f44b28e2ae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f44b28e2ad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f44b28e1fb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f44b28e2000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f44b28e1f90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f44b28e1fd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f44b28e2050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f44b28dfff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f44b28db430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f44b28daac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f44b28da8d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f44b28da3e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f44b28d9fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f44b28d9d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f44b28d9630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f44b28d9800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f44b28d96f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f44b28d9510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f44b28d9360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f44b28d9bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f44b28d93c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f44b28d9340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f44b28d9280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f44b28d91b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f44b28d8fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f44b28d8c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f44b28d9ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f44b28d9470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f44b28d84f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f44b28d8490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f44b28d9a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f44b28daaf0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f44b28dad30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f44b28db090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f44b28dd1f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f44b28dadc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f44b28dc210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f44b28dc380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f44b28dba50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f44b28dba00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f44b28d80a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f44b28d7ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f44b28d7e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f44b28d7bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f44b28d7f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f44b28d7ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f44b28d7dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f44b28d7d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f44b28d7b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f44b28d7a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f44b28d79d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f44b28d79b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f44b28d78c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f44b28d7c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f44b28d7950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f44b28d7800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f44b28e87a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f44b28ea840>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f44b28e8840>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f44b28e8940>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f44b28e5f20>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f44b28e5f00>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f44b28e5ea0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f44b28e5e40>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f44b28e5e80>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f44b28e8900>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f44b28e8bd0>
#> 
#> $dparse_dparse
#> <pointer: 0x7f44b28e9080>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f44b28e8ac0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f44b28e89e0>
#> 
```
