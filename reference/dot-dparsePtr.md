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
#> <pointer: 0x7f81faca1540>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f81faca15c0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f81fac8c5a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f81fac8c590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f81fac8c570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f81fac8c550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f81fac8c530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f81fac8c510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f81fac8c580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f81fac8c560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f81fac8c540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f81fac8c520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f81fac8c500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f81facac030>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f81facabff0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f81facabfb0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f81facabf70>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f81faca3300>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f81faca32f0>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f81faca3290>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f81faca3220>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f81faca3190>
#> 
#> $dparse_d_free
#> <pointer: 0x7f81faca3310>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f81faca26e0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f81faca2610>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f81faca2810>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f81faca2730>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f81faca30d0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f81faca2ec0>
#> 
#> $dparse_set_union
#> <pointer: 0x7f81faca2d00>
#> 
#> $dparse_set_add
#> <pointer: 0x7f81faca2d70>
#> 
#> $dparse_set_find
#> <pointer: 0x7f81faca2cb0>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f81faca2bc0>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f81faca2ae0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f81faca1bb0>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f81faca1b90>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f81faca1b70>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f81faca1b50>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f81faca1af0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f81faca0870>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f81fac9aae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f81fac9aad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f81fac99fb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f81fac9a000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f81fac99f90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f81fac99fd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f81fac9a050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f81fac97ff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f81fac93430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f81fac92ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f81fac928d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f81fac923e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f81fac91fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f81fac91d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f81fac91630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f81fac91800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f81fac916f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f81fac91510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f81fac91360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f81fac91bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f81fac913c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f81fac91340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f81fac91280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f81fac911b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f81fac90fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f81fac90c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f81fac91ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f81fac91470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f81fac904f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f81fac90490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f81fac91a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f81fac92af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f81fac92d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f81fac93090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f81fac951f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f81fac92dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f81fac94210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f81fac94380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f81fac93a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f81fac93a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f81fac900a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f81fac8fed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f81fac8fe50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f81fac8fbf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f81fac8ff90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f81fac8fff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f81fac8fdd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f81fac8fd70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f81fac8fb40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f81fac8fa30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f81fac8f9d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f81fac8f9b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f81fac8f8c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f81fac8fc30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f81fac8f950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f81fac8f800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f81faca06f0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f81faca2670>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f81faca0790>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f81faca0890>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f81fac9de90>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f81fac9de70>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f81fac9de10>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f81fac9ddb0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f81fac9ddf0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f81faca0850>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f81faca0af0>
#> 
#> $dparse_dparse
#> <pointer: 0x7f81faca0f80>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f81faca09e0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f81faca0930>
#> 
```
