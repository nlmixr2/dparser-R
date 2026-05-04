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
#> <pointer: 0x7fd366c26590>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7fd366c26610>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7fd366c115a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7fd366c11590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7fd366c11570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7fd366c11550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7fd366c11530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7fd366c11510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7fd366c11580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7fd366c11560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7fd366c11540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7fd366c11520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7fd366c11500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7fd366c31190>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7fd366c31150>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7fd366c31110>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7fd366c310d0>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7fd366c28460>
#> 
#> $dparse_escape_string
#> <pointer: 0x7fd366c28450>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7fd366c283f0>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7fd366c28380>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7fd366c282f0>
#> 
#> $dparse_d_free
#> <pointer: 0x7fd366c28470>
#> 
#> $dparse_strhashl
#> <pointer: 0x7fd366c27800>
#> 
#> $dparse_dup_str
#> <pointer: 0x7fd366c27730>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7fd366c27970>
#> 
#> $dparse_buf_read
#> <pointer: 0x7fd366c27850>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7fd366c28230>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7fd366c28020>
#> 
#> $dparse_set_union
#> <pointer: 0x7fd366c27e60>
#> 
#> $dparse_set_add
#> <pointer: 0x7fd366c27ed0>
#> 
#> $dparse_set_find
#> <pointer: 0x7fd366c27e10>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7fd366c27d20>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7fd366c27c40>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7fd366c26cd0>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7fd366c26cb0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7fd366c26c90>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7fd366c26c70>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7fd366c26c10>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7fd366c25870>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7fd366c1fae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7fd366c1fad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7fd366c1efb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7fd366c1f000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7fd366c1ef90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7fd366c1efd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7fd366c1f050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7fd366c1cff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7fd366c18430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7fd366c17ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7fd366c178d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7fd366c173e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7fd366c16fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7fd366c16d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7fd366c16630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7fd366c16800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7fd366c166f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7fd366c16510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7fd366c16360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7fd366c16bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7fd366c163c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7fd366c16340>
#> 
#> $dparse_new_token
#> <pointer: 0x7fd366c16280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7fd366c161b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7fd366c15fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7fd366c15c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7fd366c16ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7fd366c16470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7fd366c154f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7fd366c15490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7fd366c16a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7fd366c17af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7fd366c17d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7fd366c18090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7fd366c1a1f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7fd366c17dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7fd366c19210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7fd366c19380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7fd366c18a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7fd366c18a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7fd366c150a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7fd366c14ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7fd366c14e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7fd366c14bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7fd366c14f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7fd366c14ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7fd366c14dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7fd366c14d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7fd366c14b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7fd366c14a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7fd366c149d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7fd366c149b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7fd366c148c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7fd366c14c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7fd366c14950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7fd366c14800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7fd366c256f0>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7fd366c27790>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7fd366c25790>
#> 
#> $dparse_d_pass
#> <pointer: 0x7fd366c25890>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7fd366c22e90>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7fd366c22e70>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7fd366c22e10>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7fd366c22db0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7fd366c22df0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7fd366c25850>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7fd366c25b20>
#> 
#> $dparse_dparse
#> <pointer: 0x7fd366c25fd0>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7fd366c25a10>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7fd366c25930>
#> 
```
