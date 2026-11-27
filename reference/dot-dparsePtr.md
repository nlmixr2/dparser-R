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
#> <pointer: 0x79591a55e3f0>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x79591a55e470>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x79591a548550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x79591a548540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x79591a548520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x79591a548500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x79591a5484e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x79591a5484c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x79591a548530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x79591a548510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x79591a5484f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x79591a5484d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x79591a5484b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x79591a5692b0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x79591a569270>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x79591a569230>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x79591a5691f0>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x79591a5603a0>
#> 
#> $dparse_escape_string
#> <pointer: 0x79591a560390>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x79591a560310>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x79591a5602a0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x79591a560210>
#> 
#> $dparse_d_free
#> <pointer: 0x79591a5603b0>
#> 
#> $dparse_strhashl
#> <pointer: 0x79591a55f670>
#> 
#> $dparse_dup_str
#> <pointer: 0x79591a55f5b0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x79591a55f810>
#> 
#> $dparse_buf_read
#> <pointer: 0x79591a55f6c0>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x79591a560150>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x79591a55ff30>
#> 
#> $dparse_set_union
#> <pointer: 0x79591a55fd60>
#> 
#> $dparse_set_add
#> <pointer: 0x79591a55fdd0>
#> 
#> $dparse_set_find
#> <pointer: 0x79591a55fd10>
#> 
#> $dparse_vec_eq
#> <pointer: 0x79591a55fc10>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x79591a55fad0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x79591a55eb00>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x79591a55eae0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x79591a55eac0>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x79591a55eaa0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x79591a55ea40>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x79591a55d6a0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x79591a5571f0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x79591a5571e0>
#> 
#> $dparse_free_Action
#> <pointer: 0x79591a556640>
#> 
#> $dparse_goto_State
#> <pointer: 0x79591a5566b0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x79591a556620>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x79591a556680>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x79591a556710>
#> 
#> $dparse_build_scanners
#> <pointer: 0x79591a5545d0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x79591a54f7e0>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x79591a54ee10>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x79591a54ec30>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x79591a54e750>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x79591a54e300>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x79591a54e0d0>
#> 
#> $dparse_find_pass
#> <pointer: 0x79591a54d9a0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x79591a54db90>
#> 
#> $dparse_add_pass
#> <pointer: 0x79591a54da70>
#> 
#> $dparse_add_declaration
#> <pointer: 0x79591a54d870>
#> 
#> $dparse_dup_elem
#> <pointer: 0x79591a54d670>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x79591a54df30>
#> 
#> $dparse_add_global_code
#> <pointer: 0x79591a54d6f0>
#> 
#> $dparse_new_code
#> <pointer: 0x79591a54d650>
#> 
#> $dparse_new_token
#> <pointer: 0x79591a54d590>
#> 
#> $dparse_new_ident
#> <pointer: 0x79591a54d4c0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x79591a54d2c0>
#> 
#> $dparse_new_string
#> <pointer: 0x79591a54cf30>
#> 
#> $dparse_new_production
#> <pointer: 0x79591a54de60>
#> 
#> $dparse_new_declaration
#> <pointer: 0x79591a54d7d0>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x79591a54c7c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x79591a54c760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x79591a54ddf0>
#> 
#> $dparse_print_term
#> <pointer: 0x79591a54ee50>
#> 
#> $dparse_print_rule
#> <pointer: 0x79591a54f0c0>
#> 
#> $dparse_print_states
#> <pointer: 0x79591a54f430>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x79591a551680>
#> 
#> $dparse_print_grammar
#> <pointer: 0x79591a54f150>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x79591a5505e0>
#> 
#> $dparse_build_grammar
#> <pointer: 0x79591a550760>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x79591a54fe30>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x79591a54fde0>
#> 
#> $dparse_print_scope
#> <pointer: 0x79591a54c2f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x79591a54c110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x79591a54c090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x79591a54be10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x79591a54c1d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x79591a54c230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x79591a54c010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x79591a54bfb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x79591a54bd40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x79591a54bc10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x79591a54bbb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x79591a54bb90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x79591a54ba90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x79591a54be50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x79591a54bb30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x79591a54b9d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x79591a55d520>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x79591a55f600>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x79591a55d5b0>
#> 
#> $dparse_d_pass
#> <pointer: 0x79591a55d6c0>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x79591a55a8d0>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x79591a55a8b0>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x79591a55a850>
#> 
#> $dparse_d_get_child
#> <pointer: 0x79591a55a7f0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x79591a55a830>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x79591a55d680>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x79591a55d9a0>
#> 
#> $dparse_dparse
#> <pointer: 0x79591a55de90>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x79591a55d860>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x79591a55d790>
#> 
```
