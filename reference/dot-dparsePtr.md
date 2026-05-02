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
#> <pointer: 0x7f7db48bd500>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f7db48bd580>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f7db48a8590>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f7db48a8580>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f7db48a8560>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f7db48a8540>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f7db48a8520>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f7db48a8500>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f7db48a8570>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f7db48a8550>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f7db48a8530>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f7db48a8510>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f7db48a84f0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f7db48c7ff0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f7db48c7fb0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f7db48c7f70>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f7db48c7f30>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f7db48bf2c0>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f7db48bf2b0>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f7db48bf250>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f7db48bf1e0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f7db48bf150>
#> 
#> $dparse_d_free
#> <pointer: 0x7f7db48bf2d0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f7db48be6a0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f7db48be5d0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f7db48be7d0>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f7db48be6f0>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f7db48bf090>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f7db48bee80>
#> 
#> $dparse_set_union
#> <pointer: 0x7f7db48becc0>
#> 
#> $dparse_set_add
#> <pointer: 0x7f7db48bed30>
#> 
#> $dparse_set_find
#> <pointer: 0x7f7db48bec70>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f7db48beb80>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f7db48beaa0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f7db48bdb70>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f7db48bdb50>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f7db48bdb30>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f7db48bdb10>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f7db48bdab0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f7db48bc850>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f7db48b6ac0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f7db48b6ab0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f7db48b5f90>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f7db48b5fe0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f7db48b5f70>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f7db48b5fb0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f7db48b6030>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f7db48b3fd0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f7db48af410>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f7db48aeaa0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f7db48ae8b0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f7db48ae3c0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f7db48adf80>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f7db48add20>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f7db48ad610>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f7db48ad7e0>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f7db48ad6d0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f7db48ad4f0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f7db48ad340>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f7db48adb90>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f7db48ad3a0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f7db48ad320>
#> 
#> $dparse_new_token
#> <pointer: 0x7f7db48ad260>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f7db48ad190>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f7db48acf90>
#> 
#> $dparse_new_string
#> <pointer: 0x7f7db48acc60>
#> 
#> $dparse_new_production
#> <pointer: 0x7f7db48adac0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f7db48ad450>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f7db48ac4d0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f7db48ac470>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f7db48ada50>
#> 
#> $dparse_print_term
#> <pointer: 0x7f7db48aead0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f7db48aed10>
#> 
#> $dparse_print_states
#> <pointer: 0x7f7db48af070>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f7db48b11d0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f7db48aeda0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f7db48b01f0>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f7db48b0360>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f7db48afa30>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f7db48af9e0>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f7db48ac080>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f7db48abeb0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f7db48abe30>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f7db48abbd0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f7db48abf70>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f7db48abfd0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f7db48abdb0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f7db48abd50>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f7db48abb20>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f7db48aba10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f7db48ab9b0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f7db48ab990>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f7db48ab8a0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f7db48abc10>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f7db48ab930>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f7db48ab7e0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f7db48bc6d0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f7db48be630>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f7db48bc770>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f7db48bc870>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f7db48b9e70>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f7db48b9e50>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f7db48b9df0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f7db48b9d90>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f7db48b9dd0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f7db48bc830>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f7db48bcad0>
#> 
#> $dparse_dparse
#> <pointer: 0x7f7db48bcbb0>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f7db48bc9c0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f7db48bc910>
#> 
```
