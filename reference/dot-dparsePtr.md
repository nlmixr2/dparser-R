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
#> <pointer: 0x781282bdf470>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x781282bdf4f0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x781282bc9550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x781282bc9540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x781282bc9520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x781282bc9500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x781282bc94e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x781282bc94c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x781282bc9530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x781282bc9510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x781282bc94f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x781282bc94d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x781282bc94b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x781282bea330>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x781282bea2f0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x781282bea2b0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x781282bea270>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x781282be1420>
#> 
#> $dparse_escape_string
#> <pointer: 0x781282be1410>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x781282be1390>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x781282be1320>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x781282be1290>
#> 
#> $dparse_d_free
#> <pointer: 0x781282be1430>
#> 
#> $dparse_strhashl
#> <pointer: 0x781282be06c0>
#> 
#> $dparse_dup_str
#> <pointer: 0x781282be0600>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x781282be0890>
#> 
#> $dparse_buf_read
#> <pointer: 0x781282be0740>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x781282be11d0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x781282be0fb0>
#> 
#> $dparse_set_union
#> <pointer: 0x781282be0de0>
#> 
#> $dparse_set_add
#> <pointer: 0x781282be0e50>
#> 
#> $dparse_set_find
#> <pointer: 0x781282be0d90>
#> 
#> $dparse_vec_eq
#> <pointer: 0x781282be0c90>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x781282be0b50>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x781282bdfb80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x781282bdfb60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x781282bdfb40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x781282bdfb20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x781282bdfac0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x781282bde720>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x781282bd8270>
#> 
#> $dparse_mkdparse
#> <pointer: 0x781282bd8260>
#> 
#> $dparse_free_Action
#> <pointer: 0x781282bd76c0>
#> 
#> $dparse_goto_State
#> <pointer: 0x781282bd7730>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x781282bd76a0>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x781282bd7700>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x781282bd7790>
#> 
#> $dparse_build_scanners
#> <pointer: 0x781282bd5620>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x781282bd0820>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x781282bcfe50>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x781282bcfc70>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x781282bcf790>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x781282bcf340>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x781282bcf110>
#> 
#> $dparse_find_pass
#> <pointer: 0x781282bce9e0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x781282bcebd0>
#> 
#> $dparse_add_pass
#> <pointer: 0x781282bceab0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x781282bce8b0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x781282bce6b0>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x781282bcef70>
#> 
#> $dparse_add_global_code
#> <pointer: 0x781282bce730>
#> 
#> $dparse_new_code
#> <pointer: 0x781282bce690>
#> 
#> $dparse_new_token
#> <pointer: 0x781282bce5d0>
#> 
#> $dparse_new_ident
#> <pointer: 0x781282bce500>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x781282bce2e0>
#> 
#> $dparse_new_string
#> <pointer: 0x781282bcdf40>
#> 
#> $dparse_new_production
#> <pointer: 0x781282bceea0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x781282bce810>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x781282bcd7c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x781282bcd760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x781282bcee30>
#> 
#> $dparse_print_term
#> <pointer: 0x781282bcfe90>
#> 
#> $dparse_print_rule
#> <pointer: 0x781282bd0100>
#> 
#> $dparse_print_states
#> <pointer: 0x781282bd0470>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x781282bd26c0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x781282bd0190>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x781282bd1620>
#> 
#> $dparse_build_grammar
#> <pointer: 0x781282bd17a0>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x781282bd0e70>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x781282bd0e20>
#> 
#> $dparse_print_scope
#> <pointer: 0x781282bcd2f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x781282bcd110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x781282bcd090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x781282bcce10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x781282bcd1d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x781282bcd230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x781282bcd010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x781282bccfb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x781282bccd40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x781282bccc10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x781282bccbb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x781282bccb90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x781282bcca90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x781282bcce50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x781282bccb30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x781282bcc9d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x781282bde5a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x781282be0650>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x781282bde630>
#> 
#> $dparse_d_pass
#> <pointer: 0x781282bde740>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x781282bdb950>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x781282bdb930>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x781282bdb8d0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x781282bdb870>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x781282bdb8b0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x781282bde700>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x781282bdea20>
#> 
#> $dparse_dparse
#> <pointer: 0x781282bdef10>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x781282bde8e0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x781282bde810>
#> 
```
