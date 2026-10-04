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
#> <pointer: 0x7f2a41bf75c0>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f2a41bf7640>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f2a41be25a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f2a41be2590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f2a41be2570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f2a41be2550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f2a41be2530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f2a41be2510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f2a41be2580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f2a41be2560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f2a41be2540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f2a41be2520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f2a41be2500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f2a41c021c0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f2a41c02180>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f2a41c02140>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f2a41c02100>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f2a41bf9490>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f2a41bf9480>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f2a41bf9420>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f2a41bf93b0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f2a41bf9320>
#> 
#> $dparse_d_free
#> <pointer: 0x7f2a41bf94a0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f2a41bf8830>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f2a41bf8760>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f2a41bf89a0>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f2a41bf8880>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f2a41bf9260>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f2a41bf9050>
#> 
#> $dparse_set_union
#> <pointer: 0x7f2a41bf8e90>
#> 
#> $dparse_set_add
#> <pointer: 0x7f2a41bf8f00>
#> 
#> $dparse_set_find
#> <pointer: 0x7f2a41bf8e40>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f2a41bf8d50>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f2a41bf8c70>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f2a41bf7d00>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f2a41bf7ce0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f2a41bf7cc0>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f2a41bf7ca0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f2a41bf7c40>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f2a41bf68a0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f2a41bf0ae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f2a41bf0ad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f2a41beffb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f2a41bf0000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f2a41beff90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f2a41beffd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f2a41bf0050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f2a41bedff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f2a41be9430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f2a41be8ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f2a41be88d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f2a41be83e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f2a41be7fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f2a41be7d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f2a41be7630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f2a41be7800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f2a41be76f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f2a41be7510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f2a41be7360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f2a41be7bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f2a41be73c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f2a41be7340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f2a41be7280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f2a41be71b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f2a41be6fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f2a41be6c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f2a41be7ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f2a41be7470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f2a41be64f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f2a41be6490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f2a41be7a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f2a41be8af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f2a41be8d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f2a41be9090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f2a41beb1f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f2a41be8dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f2a41bea210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f2a41bea380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f2a41be9a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f2a41be9a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f2a41be60a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f2a41be5ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f2a41be5e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f2a41be5bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f2a41be5f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f2a41be5ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f2a41be5dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f2a41be5d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f2a41be5b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f2a41be5a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f2a41be59d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f2a41be59b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f2a41be58c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f2a41be5c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f2a41be5950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f2a41be5800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f2a41bf6720>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f2a41bf87c0>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f2a41bf67c0>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f2a41bf68c0>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f2a41bf3e90>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f2a41bf3e70>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f2a41bf3e10>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f2a41bf3db0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f2a41bf3df0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f2a41bf6880>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f2a41bf6b50>
#> 
#> $dparse_dparse
#> <pointer: 0x7f2a41bf7000>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f2a41bf6a40>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f2a41bf6960>
#> 
```
