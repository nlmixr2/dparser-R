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
#> <pointer: 0x7efd6a6e9590>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7efd6a6e9610>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7efd6a6d45a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7efd6a6d4590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7efd6a6d4570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7efd6a6d4550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7efd6a6d4530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7efd6a6d4510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7efd6a6d4580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7efd6a6d4560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7efd6a6d4540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7efd6a6d4520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7efd6a6d4500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7efd6a6f4190>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7efd6a6f4150>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7efd6a6f4110>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7efd6a6f40d0>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7efd6a6eb460>
#> 
#> $dparse_escape_string
#> <pointer: 0x7efd6a6eb450>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7efd6a6eb3f0>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7efd6a6eb380>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7efd6a6eb2f0>
#> 
#> $dparse_d_free
#> <pointer: 0x7efd6a6eb470>
#> 
#> $dparse_strhashl
#> <pointer: 0x7efd6a6ea800>
#> 
#> $dparse_dup_str
#> <pointer: 0x7efd6a6ea730>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7efd6a6ea970>
#> 
#> $dparse_buf_read
#> <pointer: 0x7efd6a6ea850>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7efd6a6eb230>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7efd6a6eb020>
#> 
#> $dparse_set_union
#> <pointer: 0x7efd6a6eae60>
#> 
#> $dparse_set_add
#> <pointer: 0x7efd6a6eaed0>
#> 
#> $dparse_set_find
#> <pointer: 0x7efd6a6eae10>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7efd6a6ead20>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7efd6a6eac40>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7efd6a6e9cd0>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7efd6a6e9cb0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7efd6a6e9c90>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7efd6a6e9c70>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7efd6a6e9c10>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7efd6a6e8870>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7efd6a6e2ae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7efd6a6e2ad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7efd6a6e1fb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7efd6a6e2000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7efd6a6e1f90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7efd6a6e1fd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7efd6a6e2050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7efd6a6dfff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7efd6a6db430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7efd6a6daac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7efd6a6da8d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7efd6a6da3e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7efd6a6d9fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7efd6a6d9d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7efd6a6d9630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7efd6a6d9800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7efd6a6d96f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7efd6a6d9510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7efd6a6d9360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7efd6a6d9bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7efd6a6d93c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7efd6a6d9340>
#> 
#> $dparse_new_token
#> <pointer: 0x7efd6a6d9280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7efd6a6d91b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7efd6a6d8fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7efd6a6d8c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7efd6a6d9ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7efd6a6d9470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7efd6a6d84f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7efd6a6d8490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7efd6a6d9a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7efd6a6daaf0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7efd6a6dad30>
#> 
#> $dparse_print_states
#> <pointer: 0x7efd6a6db090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7efd6a6dd1f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7efd6a6dadc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7efd6a6dc210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7efd6a6dc380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7efd6a6dba50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7efd6a6dba00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7efd6a6d80a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7efd6a6d7ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7efd6a6d7e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7efd6a6d7bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7efd6a6d7f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7efd6a6d7ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7efd6a6d7dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7efd6a6d7d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7efd6a6d7b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7efd6a6d7a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7efd6a6d79d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7efd6a6d79b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7efd6a6d78c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7efd6a6d7c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7efd6a6d7950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7efd6a6d7800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7efd6a6e86f0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7efd6a6ea790>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7efd6a6e8790>
#> 
#> $dparse_d_pass
#> <pointer: 0x7efd6a6e8890>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7efd6a6e5e90>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7efd6a6e5e70>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7efd6a6e5e10>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7efd6a6e5db0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7efd6a6e5df0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7efd6a6e8850>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7efd6a6e8b20>
#> 
#> $dparse_dparse
#> <pointer: 0x7efd6a6e8fd0>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7efd6a6e8a10>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7efd6a6e8930>
#> 
```
