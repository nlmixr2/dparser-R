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
#> <pointer: 0x7f2e28837540>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f2e288375c0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f2e288225a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f2e28822590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f2e28822570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f2e28822550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f2e28822530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f2e28822510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f2e28822580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f2e28822560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f2e28822540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f2e28822520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f2e28822500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f2e28842100>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f2e288420c0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f2e28842080>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f2e28842040>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f2e288393d0>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f2e288393c0>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f2e28839360>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f2e288392f0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f2e28839260>
#> 
#> $dparse_d_free
#> <pointer: 0x7f2e288393e0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f2e288387b0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f2e288386e0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f2e288388e0>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f2e28838800>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f2e288391a0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f2e28838f90>
#> 
#> $dparse_set_union
#> <pointer: 0x7f2e28838dd0>
#> 
#> $dparse_set_add
#> <pointer: 0x7f2e28838e40>
#> 
#> $dparse_set_find
#> <pointer: 0x7f2e28838d80>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f2e28838c90>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f2e28838bb0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f2e28837c80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f2e28837c60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f2e28837c40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f2e28837c20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f2e28837bc0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f2e28836870>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f2e28830ae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f2e28830ad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f2e2882ffb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f2e28830000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f2e2882ff90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f2e2882ffd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f2e28830050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f2e2882dff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f2e28829430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f2e28828ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f2e288288d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f2e288283e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f2e28827fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f2e28827d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f2e28827630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f2e28827800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f2e288276f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f2e28827510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f2e28827360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f2e28827bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f2e288273c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f2e28827340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f2e28827280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f2e288271b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f2e28826fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f2e28826c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f2e28827ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f2e28827470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f2e288264f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f2e28826490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f2e28827a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f2e28828af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f2e28828d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f2e28829090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f2e2882b1f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f2e28828dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f2e2882a210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f2e2882a380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f2e28829a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f2e28829a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f2e288260a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f2e28825ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f2e28825e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f2e28825bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f2e28825f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f2e28825ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f2e28825dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f2e28825d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f2e28825b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f2e28825a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f2e288259d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f2e288259b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f2e288258c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f2e28825c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f2e28825950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f2e28825800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f2e288366f0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f2e28838740>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f2e28836790>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f2e28836890>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f2e28833e90>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f2e28833e70>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f2e28833e10>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f2e28833db0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f2e28833df0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f2e28836850>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f2e28836af0>
#> 
#> $dparse_dparse
#> <pointer: 0x7f2e28836f80>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f2e288369e0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f2e28836930>
#> 
```
