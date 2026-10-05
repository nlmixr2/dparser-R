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
#> <pointer: 0x7f11c2c26640>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f11c2c266c0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f11c2c115a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f11c2c11590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f11c2c11570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f11c2c11550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f11c2c11530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f11c2c11510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f11c2c11580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f11c2c11560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f11c2c11540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f11c2c11520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f11c2c11500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f11c2c31240>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f11c2c31200>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f11c2c311c0>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f11c2c31180>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f11c2c28510>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f11c2c28500>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f11c2c284a0>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f11c2c28430>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f11c2c283a0>
#> 
#> $dparse_d_free
#> <pointer: 0x7f11c2c28520>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f11c2c278b0>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f11c2c277e0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f11c2c27a20>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f11c2c27900>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f11c2c282e0>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f11c2c280d0>
#> 
#> $dparse_set_union
#> <pointer: 0x7f11c2c27f10>
#> 
#> $dparse_set_add
#> <pointer: 0x7f11c2c27f80>
#> 
#> $dparse_set_find
#> <pointer: 0x7f11c2c27ec0>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f11c2c27dd0>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f11c2c27cf0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f11c2c26d80>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f11c2c26d60>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f11c2c26d40>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f11c2c26d20>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f11c2c26cc0>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f11c2c25920>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f11c2c1fae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f11c2c1fad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f11c2c1efb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f11c2c1f000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f11c2c1ef90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f11c2c1efd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f11c2c1f050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f11c2c1cff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f11c2c18430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f11c2c17ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f11c2c178d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f11c2c173e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f11c2c16fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f11c2c16d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f11c2c16630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f11c2c16800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f11c2c166f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f11c2c16510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f11c2c16360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f11c2c16bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f11c2c163c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f11c2c16340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f11c2c16280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f11c2c161b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f11c2c15fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f11c2c15c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f11c2c16ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f11c2c16470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f11c2c154f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f11c2c15490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f11c2c16a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f11c2c17af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f11c2c17d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f11c2c18090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f11c2c1a1f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f11c2c17dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f11c2c19210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f11c2c19380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f11c2c18a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f11c2c18a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f11c2c150a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f11c2c14ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f11c2c14e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f11c2c14bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f11c2c14f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f11c2c14ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f11c2c14dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f11c2c14d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f11c2c14b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f11c2c14a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f11c2c149d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f11c2c149b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f11c2c148c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f11c2c14c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f11c2c14950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f11c2c14800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f11c2c257a0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f11c2c27840>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f11c2c25840>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f11c2c25940>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f11c2c22f20>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f11c2c22f00>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f11c2c22ea0>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f11c2c22e40>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f11c2c22e80>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f11c2c25900>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f11c2c25bd0>
#> 
#> $dparse_dparse
#> <pointer: 0x7f11c2c26080>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f11c2c25ac0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f11c2c259e0>
#> 
```
