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
#> <pointer: 0x77dc323bb3f0>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x77dc323bb470>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x77dc323a5550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x77dc323a5540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x77dc323a5520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x77dc323a5500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x77dc323a54e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x77dc323a54c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x77dc323a5530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x77dc323a5510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x77dc323a54f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x77dc323a54d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x77dc323a54b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x77dc323c62b0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x77dc323c6270>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x77dc323c6230>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x77dc323c61f0>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x77dc323bd3a0>
#> 
#> $dparse_escape_string
#> <pointer: 0x77dc323bd390>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x77dc323bd310>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x77dc323bd2a0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x77dc323bd210>
#> 
#> $dparse_d_free
#> <pointer: 0x77dc323bd3b0>
#> 
#> $dparse_strhashl
#> <pointer: 0x77dc323bc640>
#> 
#> $dparse_dup_str
#> <pointer: 0x77dc323bc580>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x77dc323bc810>
#> 
#> $dparse_buf_read
#> <pointer: 0x77dc323bc6c0>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x77dc323bd150>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x77dc323bcf30>
#> 
#> $dparse_set_union
#> <pointer: 0x77dc323bcd60>
#> 
#> $dparse_set_add
#> <pointer: 0x77dc323bcdd0>
#> 
#> $dparse_set_find
#> <pointer: 0x77dc323bcd10>
#> 
#> $dparse_vec_eq
#> <pointer: 0x77dc323bcc10>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x77dc323bcad0>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x77dc323bbb00>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x77dc323bbae0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x77dc323bbac0>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x77dc323bbaa0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x77dc323bba40>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x77dc323ba6a0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x77dc323b41f0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x77dc323b41e0>
#> 
#> $dparse_free_Action
#> <pointer: 0x77dc323b3640>
#> 
#> $dparse_goto_State
#> <pointer: 0x77dc323b36b0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x77dc323b3620>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x77dc323b3680>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x77dc323b3710>
#> 
#> $dparse_build_scanners
#> <pointer: 0x77dc323b15a0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x77dc323ac820>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x77dc323abe50>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x77dc323abc70>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x77dc323ab790>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x77dc323ab340>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x77dc323ab110>
#> 
#> $dparse_find_pass
#> <pointer: 0x77dc323aa9e0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x77dc323aabd0>
#> 
#> $dparse_add_pass
#> <pointer: 0x77dc323aaab0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x77dc323aa8b0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x77dc323aa6b0>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x77dc323aaf70>
#> 
#> $dparse_add_global_code
#> <pointer: 0x77dc323aa730>
#> 
#> $dparse_new_code
#> <pointer: 0x77dc323aa690>
#> 
#> $dparse_new_token
#> <pointer: 0x77dc323aa5d0>
#> 
#> $dparse_new_ident
#> <pointer: 0x77dc323aa500>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x77dc323aa2e0>
#> 
#> $dparse_new_string
#> <pointer: 0x77dc323a9f40>
#> 
#> $dparse_new_production
#> <pointer: 0x77dc323aaea0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x77dc323aa810>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x77dc323a97c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x77dc323a9760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x77dc323aae30>
#> 
#> $dparse_print_term
#> <pointer: 0x77dc323abe90>
#> 
#> $dparse_print_rule
#> <pointer: 0x77dc323ac100>
#> 
#> $dparse_print_states
#> <pointer: 0x77dc323ac470>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x77dc323ae6c0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x77dc323ac190>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x77dc323ad620>
#> 
#> $dparse_build_grammar
#> <pointer: 0x77dc323ad7a0>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x77dc323ace70>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x77dc323ace20>
#> 
#> $dparse_print_scope
#> <pointer: 0x77dc323a92f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x77dc323a9110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x77dc323a9090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x77dc323a8e10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x77dc323a91d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x77dc323a9230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x77dc323a9010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x77dc323a8fb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x77dc323a8d40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x77dc323a8c10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x77dc323a8bb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x77dc323a8b90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x77dc323a8a90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x77dc323a8e50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x77dc323a8b30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x77dc323a89d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x77dc323ba520>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x77dc323bc5d0>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x77dc323ba5b0>
#> 
#> $dparse_d_pass
#> <pointer: 0x77dc323ba6c0>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x77dc323b78d0>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x77dc323b78b0>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x77dc323b7850>
#> 
#> $dparse_d_get_child
#> <pointer: 0x77dc323b77f0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x77dc323b7830>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x77dc323ba680>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x77dc323ba9a0>
#> 
#> $dparse_dparse
#> <pointer: 0x77dc323bae90>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x77dc323ba860>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x77dc323ba790>
#> 
```
