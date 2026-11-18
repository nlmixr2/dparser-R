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
#> <pointer: 0x7eef81ffc370>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7eef81ffc3f0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7eef81fe6550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7eef81fe6540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7eef81fe6520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7eef81fe6500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7eef81fe64e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7eef81fe64c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7eef81fe6530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7eef81fe6510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7eef81fe64f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7eef81fe64d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7eef81fe64b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7eef82007230>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7eef820071f0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7eef820071b0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7eef82007170>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7eef81ffe320>
#> 
#> $dparse_escape_string
#> <pointer: 0x7eef81ffe310>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7eef81ffe290>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7eef81ffe220>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7eef81ffe190>
#> 
#> $dparse_d_free
#> <pointer: 0x7eef81ffe330>
#> 
#> $dparse_strhashl
#> <pointer: 0x7eef81ffd5f0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7eef81ffd530>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7eef81ffd790>
#> 
#> $dparse_buf_read
#> <pointer: 0x7eef81ffd640>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7eef81ffe0d0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7eef81ffdeb0>
#> 
#> $dparse_set_union
#> <pointer: 0x7eef81ffdce0>
#> 
#> $dparse_set_add
#> <pointer: 0x7eef81ffdd50>
#> 
#> $dparse_set_find
#> <pointer: 0x7eef81ffdc90>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7eef81ffdb90>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7eef81ffda50>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7eef81ffca80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7eef81ffca60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7eef81ffca40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7eef81ffca20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7eef81ffc9c0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7eef81ffb620>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7eef81ff51f0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7eef81ff51e0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7eef81ff4640>
#> 
#> $dparse_goto_State
#> <pointer: 0x7eef81ff46b0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7eef81ff4620>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7eef81ff4680>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7eef81ff4710>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7eef81ff25d0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7eef81fed7e0>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7eef81fece10>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7eef81fecc30>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7eef81fec750>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7eef81fec300>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7eef81fec0d0>
#> 
#> $dparse_find_pass
#> <pointer: 0x7eef81feb9a0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7eef81febb90>
#> 
#> $dparse_add_pass
#> <pointer: 0x7eef81feba70>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7eef81feb870>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7eef81feb670>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7eef81febf30>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7eef81feb6f0>
#> 
#> $dparse_new_code
#> <pointer: 0x7eef81feb650>
#> 
#> $dparse_new_token
#> <pointer: 0x7eef81feb590>
#> 
#> $dparse_new_ident
#> <pointer: 0x7eef81feb4c0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7eef81feb2c0>
#> 
#> $dparse_new_string
#> <pointer: 0x7eef81feaf30>
#> 
#> $dparse_new_production
#> <pointer: 0x7eef81febe60>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7eef81feb7d0>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7eef81fea7c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7eef81fea760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7eef81febdf0>
#> 
#> $dparse_print_term
#> <pointer: 0x7eef81fece50>
#> 
#> $dparse_print_rule
#> <pointer: 0x7eef81fed0c0>
#> 
#> $dparse_print_states
#> <pointer: 0x7eef81fed430>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7eef81fef680>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7eef81fed150>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7eef81fee5e0>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7eef81fee760>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7eef81fede30>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7eef81fedde0>
#> 
#> $dparse_print_scope
#> <pointer: 0x7eef81fea2f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7eef81fea110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7eef81fea090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7eef81fe9e10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7eef81fea1d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7eef81fea230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7eef81fea010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7eef81fe9fb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7eef81fe9d40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7eef81fe9c10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7eef81fe9bb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7eef81fe9b90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7eef81fe9a90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7eef81fe9e50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7eef81fe9b30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7eef81fe99d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7eef81ffb4a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7eef81ffd580>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7eef81ffb530>
#> 
#> $dparse_d_pass
#> <pointer: 0x7eef81ffb640>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7eef81ff8870>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7eef81ff8850>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7eef81ff87f0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7eef81ff8790>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7eef81ff87d0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7eef81ffb600>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7eef81ffb920>
#> 
#> $dparse_dparse
#> <pointer: 0x7eef81ffbe10>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7eef81ffb7e0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7eef81ffb710>
#> 
```
