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
#> <pointer: 0x762cb312f470>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x762cb312f4f0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x762cb3119550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x762cb3119540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x762cb3119520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x762cb3119500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x762cb31194e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x762cb31194c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x762cb3119530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x762cb3119510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x762cb31194f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x762cb31194d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x762cb31194b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x762cb313a330>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x762cb313a2f0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x762cb313a2b0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x762cb313a270>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x762cb3131420>
#> 
#> $dparse_escape_string
#> <pointer: 0x762cb3131410>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x762cb3131390>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x762cb3131320>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x762cb3131290>
#> 
#> $dparse_d_free
#> <pointer: 0x762cb3131430>
#> 
#> $dparse_strhashl
#> <pointer: 0x762cb31306c0>
#> 
#> $dparse_dup_str
#> <pointer: 0x762cb3130600>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x762cb3130890>
#> 
#> $dparse_buf_read
#> <pointer: 0x762cb3130740>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x762cb31311d0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x762cb3130fb0>
#> 
#> $dparse_set_union
#> <pointer: 0x762cb3130de0>
#> 
#> $dparse_set_add
#> <pointer: 0x762cb3130e50>
#> 
#> $dparse_set_find
#> <pointer: 0x762cb3130d90>
#> 
#> $dparse_vec_eq
#> <pointer: 0x762cb3130c90>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x762cb3130b50>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x762cb312fb80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x762cb312fb60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x762cb312fb40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x762cb312fb20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x762cb312fac0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x762cb312e720>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x762cb3128270>
#> 
#> $dparse_mkdparse
#> <pointer: 0x762cb3128260>
#> 
#> $dparse_free_Action
#> <pointer: 0x762cb31276c0>
#> 
#> $dparse_goto_State
#> <pointer: 0x762cb3127730>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x762cb31276a0>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x762cb3127700>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x762cb3127790>
#> 
#> $dparse_build_scanners
#> <pointer: 0x762cb3125620>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x762cb3120820>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x762cb311fe50>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x762cb311fc70>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x762cb311f790>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x762cb311f340>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x762cb311f110>
#> 
#> $dparse_find_pass
#> <pointer: 0x762cb311e9e0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x762cb311ebd0>
#> 
#> $dparse_add_pass
#> <pointer: 0x762cb311eab0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x762cb311e8b0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x762cb311e6b0>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x762cb311ef70>
#> 
#> $dparse_add_global_code
#> <pointer: 0x762cb311e730>
#> 
#> $dparse_new_code
#> <pointer: 0x762cb311e690>
#> 
#> $dparse_new_token
#> <pointer: 0x762cb311e5d0>
#> 
#> $dparse_new_ident
#> <pointer: 0x762cb311e500>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x762cb311e2e0>
#> 
#> $dparse_new_string
#> <pointer: 0x762cb311df50>
#> 
#> $dparse_new_production
#> <pointer: 0x762cb311eea0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x762cb311e810>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x762cb311d7c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x762cb311d760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x762cb311ee30>
#> 
#> $dparse_print_term
#> <pointer: 0x762cb311fe90>
#> 
#> $dparse_print_rule
#> <pointer: 0x762cb3120100>
#> 
#> $dparse_print_states
#> <pointer: 0x762cb3120470>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x762cb31226c0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x762cb3120190>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x762cb3121620>
#> 
#> $dparse_build_grammar
#> <pointer: 0x762cb31217a0>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x762cb3120e70>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x762cb3120e20>
#> 
#> $dparse_print_scope
#> <pointer: 0x762cb311d2f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x762cb311d110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x762cb311d090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x762cb311ce10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x762cb311d1d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x762cb311d230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x762cb311d010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x762cb311cfb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x762cb311cd40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x762cb311cc10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x762cb311cbb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x762cb311cb90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x762cb311ca90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x762cb311ce50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x762cb311cb30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x762cb311c9d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x762cb312e5a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x762cb3130650>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x762cb312e630>
#> 
#> $dparse_d_pass
#> <pointer: 0x762cb312e740>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x762cb312b950>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x762cb312b930>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x762cb312b8d0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x762cb312b870>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x762cb312b8b0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x762cb312e700>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x762cb312ea20>
#> 
#> $dparse_dparse
#> <pointer: 0x762cb312ef10>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x762cb312e8e0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x762cb312e810>
#> 
```
