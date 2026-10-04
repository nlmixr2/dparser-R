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
#> <pointer: 0x7f87c3fd25c0>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x7f87c3fd2640>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x7f87c3fbd5a0>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x7f87c3fbd590>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x7f87c3fbd570>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x7f87c3fbd550>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x7f87c3fbd530>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x7f87c3fbd510>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x7f87c3fbd580>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x7f87c3fbd560>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x7f87c3fbd540>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x7f87c3fbd520>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x7f87c3fbd500>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x7f87c3fdd1c0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x7f87c3fdd180>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x7f87c3fdd140>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x7f87c3fdd100>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x7f87c3fd4490>
#> 
#> $dparse_escape_string
#> <pointer: 0x7f87c3fd4480>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x7f87c3fd4420>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x7f87c3fd43b0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x7f87c3fd4320>
#> 
#> $dparse_d_free
#> <pointer: 0x7f87c3fd44a0>
#> 
#> $dparse_strhashl
#> <pointer: 0x7f87c3fd3830>
#> 
#> $dparse_dup_str
#> <pointer: 0x7f87c3fd3760>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x7f87c3fd39a0>
#> 
#> $dparse_buf_read
#> <pointer: 0x7f87c3fd3880>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x7f87c3fd4260>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x7f87c3fd4050>
#> 
#> $dparse_set_union
#> <pointer: 0x7f87c3fd3e90>
#> 
#> $dparse_set_add
#> <pointer: 0x7f87c3fd3f00>
#> 
#> $dparse_set_find
#> <pointer: 0x7f87c3fd3e40>
#> 
#> $dparse_vec_eq
#> <pointer: 0x7f87c3fd3d50>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x7f87c3fd3c70>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x7f87c3fd2d00>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x7f87c3fd2ce0>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x7f87c3fd2cc0>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x7f87c3fd2ca0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x7f87c3fd2c40>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x7f87c3fd18a0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x7f87c3fcbae0>
#> 
#> $dparse_mkdparse
#> <pointer: 0x7f87c3fcbad0>
#> 
#> $dparse_free_Action
#> <pointer: 0x7f87c3fcafb0>
#> 
#> $dparse_goto_State
#> <pointer: 0x7f87c3fcb000>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x7f87c3fcaf90>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x7f87c3fcafd0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x7f87c3fcb050>
#> 
#> $dparse_build_scanners
#> <pointer: 0x7f87c3fc8ff0>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x7f87c3fc4430>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x7f87c3fc3ac0>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x7f87c3fc38d0>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x7f87c3fc33e0>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x7f87c3fc2fa0>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x7f87c3fc2d40>
#> 
#> $dparse_find_pass
#> <pointer: 0x7f87c3fc2630>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x7f87c3fc2800>
#> 
#> $dparse_add_pass
#> <pointer: 0x7f87c3fc26f0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x7f87c3fc2510>
#> 
#> $dparse_dup_elem
#> <pointer: 0x7f87c3fc2360>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x7f87c3fc2bb0>
#> 
#> $dparse_add_global_code
#> <pointer: 0x7f87c3fc23c0>
#> 
#> $dparse_new_code
#> <pointer: 0x7f87c3fc2340>
#> 
#> $dparse_new_token
#> <pointer: 0x7f87c3fc2280>
#> 
#> $dparse_new_ident
#> <pointer: 0x7f87c3fc21b0>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x7f87c3fc1fb0>
#> 
#> $dparse_new_string
#> <pointer: 0x7f87c3fc1c80>
#> 
#> $dparse_new_production
#> <pointer: 0x7f87c3fc2ae0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x7f87c3fc2470>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x7f87c3fc14f0>
#> 
#> $dparse_new_rule
#> <pointer: 0x7f87c3fc1490>
#> 
#> $dparse_lookup_production
#> <pointer: 0x7f87c3fc2a70>
#> 
#> $dparse_print_term
#> <pointer: 0x7f87c3fc3af0>
#> 
#> $dparse_print_rule
#> <pointer: 0x7f87c3fc3d30>
#> 
#> $dparse_print_states
#> <pointer: 0x7f87c3fc4090>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x7f87c3fc61f0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x7f87c3fc3dc0>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x7f87c3fc5210>
#> 
#> $dparse_build_grammar
#> <pointer: 0x7f87c3fc5380>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x7f87c3fc4a50>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x7f87c3fc4a00>
#> 
#> $dparse_print_scope
#> <pointer: 0x7f87c3fc10a0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x7f87c3fc0ed0>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x7f87c3fc0e50>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x7f87c3fc0bf0>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x7f87c3fc0f90>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x7f87c3fc0ff0>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x7f87c3fc0dd0>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x7f87c3fc0d70>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x7f87c3fc0b40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x7f87c3fc0a30>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x7f87c3fc09d0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x7f87c3fc09b0>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x7f87c3fc08c0>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x7f87c3fc0c30>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x7f87c3fc0950>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x7f87c3fc0800>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x7f87c3fd1720>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x7f87c3fd37c0>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x7f87c3fd17c0>
#> 
#> $dparse_d_pass
#> <pointer: 0x7f87c3fd18c0>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x7f87c3fcee90>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x7f87c3fcee70>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x7f87c3fcee10>
#> 
#> $dparse_d_get_child
#> <pointer: 0x7f87c3fcedb0>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x7f87c3fcedf0>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x7f87c3fd1880>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x7f87c3fd1b50>
#> 
#> $dparse_dparse
#> <pointer: 0x7f87c3fd2000>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x7f87c3fd1a40>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x7f87c3fd1960>
#> 
```
