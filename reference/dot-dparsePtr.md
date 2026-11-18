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
#> <pointer: 0x7bef2068e230>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7bef2068e2b0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7bef20678550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7bef20678540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7bef20678520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7bef20678500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7bef206784e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7bef206784c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7bef20678530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7bef20678510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7bef206784f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7bef206784d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7bef206784b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7bef20699130>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7bef206990f0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7bef206990b0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7bef20699070>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7bef206901e0>
#> 
#> $dparse_escape_string
#> <pointer: 0x7bef206901d0>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7bef20690150>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7bef206900e0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7bef20690050>
#> 
#> $dparse_d_free
#> <pointer: 0x7bef206901f0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7bef2068f4b0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7bef2068f3f0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7bef2068f650>
#> 
#> $dparse_buf_read
#> <pointer: 0x7bef2068f500>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7bef2068ff90>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7bef2068fd70>
#> 
#> $dparse_set_union
#> <pointer: 0x7bef2068fba0>
#> 
#> $dparse_set_add
#> <pointer: 0x7bef2068fc10>
#> 
#> $dparse_set_find
#> <pointer: 0x7bef2068fb50>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7bef2068fa50>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7bef2068f910>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7bef2068e940>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7bef2068e920>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7bef2068e900>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7bef2068e8e0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7bef2068e880>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7bef2068d4e0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7bef206870b0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7bef206870a0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7bef20686500>
#> 
#> $dparse_goto_State
#> <pointer: 0x7bef20686570>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7bef206864e0>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7bef20686540>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7bef206865d0>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7bef20684490>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7bef2067f7e0>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7bef2067ee10>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7bef2067ec30>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7bef2067e750>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7bef2067e300>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7bef2067e0d0>
#> 
#> $dparse_find_pass
#> <pointer: 0x7bef2067d9a0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7bef2067db90>
#> 
#> $dparse_add_pass
#> <pointer: 0x7bef2067da70>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7bef2067d870>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7bef2067d670>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7bef2067df30>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7bef2067d6f0>
#> 
#> $dparse_new_code
#> <pointer: 0x7bef2067d650>
#> 
#> $dparse_new_token
#> <pointer: 0x7bef2067d590>
#> 
#> $dparse_new_ident
#> <pointer: 0x7bef2067d4c0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7bef2067d2c0>
#> 
#> $dparse_new_string
#> <pointer: 0x7bef2067cf30>
#> 
#> $dparse_new_production
#> <pointer: 0x7bef2067de60>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7bef2067d7d0>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7bef2067c7c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7bef2067c760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7bef2067ddf0>
#> 
#> $dparse_print_term
#> <pointer: 0x7bef2067ee50>
#> 
#> $dparse_print_rule
#> <pointer: 0x7bef2067f0c0>
#> 
#> $dparse_print_states
#> <pointer: 0x7bef2067f430>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7bef20681680>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7bef2067f150>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7bef206805e0>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7bef20680760>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7bef2067fe30>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7bef2067fde0>
#> 
#> $dparse_print_scope
#> <pointer: 0x7bef2067c2f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7bef2067c110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7bef2067c090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7bef2067be10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7bef2067c1d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7bef2067c230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7bef2067c010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7bef2067bfb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7bef2067bd40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7bef2067bc10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7bef2067bbb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7bef2067bb90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7bef2067ba90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7bef2067be50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7bef2067bb30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7bef2067b9d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7bef2068d360>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7bef2068f440>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7bef2068d3f0>
#> 
#> $dparse_d_pass
#> <pointer: 0x7bef2068d500>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7bef2068a730>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7bef2068a710>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7bef2068a6b0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7bef2068a650>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7bef2068a690>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7bef2068d4c0>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7bef2068d7e0>
#> 
#> $dparse_dparse
#> <pointer: 0x7bef2068dcd0>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7bef2068d6a0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7bef2068d5d0>
#> 
```
