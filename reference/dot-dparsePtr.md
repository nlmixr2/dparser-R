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
#> <pointer: 0x78c73791d430>
#> 
#> $dparse_dparse_sexp
#> <pointer: 0x78c73791d4b0>
#> 
#> $dparse_set_d_file_name
#> <pointer: 0x78c737907550>
#> 
#> $dparse_get_d_debug_level
#> <pointer: 0x78c737907540>
#> 
#> $dparse_get_d_verbose_level
#> <pointer: 0x78c737907520>
#> 
#> $dparse_get_d_use_file_name
#> <pointer: 0x78c737907500>
#> 
#> $dparse_get_d_rdebug_grammar_level
#> <pointer: 0x78c7379074e0>
#> 
#> $dparse_get_d_use_r_headers
#> <pointer: 0x78c7379074c0>
#> 
#> $dparse_set_d_debug_level
#> <pointer: 0x78c737907530>
#> 
#> $dparse_set_d_verbose_level
#> <pointer: 0x78c737907510>
#> 
#> $dparse_set_d_use_file_name
#> <pointer: 0x78c7379074f0>
#> 
#> $dparse_set_d_rdebug_grammar_level
#> <pointer: 0x78c7379074d0>
#> 
#> $dparse_set_d_use_r_headers
#> <pointer: 0x78c7379074b0>
#> 
#> $dparse_write_binary_tables_to_string
#> <pointer: 0x78c7379282f0>
#> 
#> $dparse_write_binary_tables_to_file
#> <pointer: 0x78c7379282b0>
#> 
#> $dparse_write_binary_tables
#> <pointer: 0x78c737928270>
#> 
#> $dparse_write_c_tables
#> <pointer: 0x78c737928230>
#> 
#> $dparse_escape_string_single_quote
#> <pointer: 0x78c73791f3e0>
#> 
#> $dparse_escape_string
#> <pointer: 0x78c73791f3d0>
#> 
#> $dparse_int_list_dup
#> <pointer: 0x78c73791f350>
#> 
#> $dparse_int_list_intersect
#> <pointer: 0x78c73791f2e0>
#> 
#> $dparse_int_list_diff
#> <pointer: 0x78c73791f250>
#> 
#> $dparse_d_free
#> <pointer: 0x78c73791f3f0>
#> 
#> $dparse_strhashl
#> <pointer: 0x78c73791e6b0>
#> 
#> $dparse_dup_str
#> <pointer: 0x78c73791e5f0>
#> 
#> $dparse_sbuf_read
#> <pointer: 0x78c73791e850>
#> 
#> $dparse_buf_read
#> <pointer: 0x78c73791e700>
#> 
#> $dparse_set_to_vec
#> <pointer: 0x78c73791f190>
#> 
#> $dparse_set_union_fn
#> <pointer: 0x78c73791ef70>
#> 
#> $dparse_set_union
#> <pointer: 0x78c73791eda0>
#> 
#> $dparse_set_add
#> <pointer: 0x78c73791ee10>
#> 
#> $dparse_set_find
#> <pointer: 0x78c73791ed50>
#> 
#> $dparse_vec_eq
#> <pointer: 0x78c73791ec50>
#> 
#> $dparse_vec_add_internal
#> <pointer: 0x78c73791eb10>
#> 
#> $dparse_scan_buffer
#> <pointer: 0x78c73791db40>
#> 
#> $dparse_free_BinaryTables
#> <pointer: 0x78c73791db20>
#> 
#> $dparse_read_binary_tables_from_string
#> <pointer: 0x78c73791db00>
#> 
#> $dparse_read_binary_tables_from_file
#> <pointer: 0x78c73791dae0>
#> 
#> $dparse_read_binary_tables
#> <pointer: 0x78c73791da80>
#> 
#> $dparse_ambiguity_count_fn
#> <pointer: 0x78c73791c6e0>
#> 
#> $dparse_mkdparse_from_string
#> <pointer: 0x78c737916230>
#> 
#> $dparse_mkdparse
#> <pointer: 0x78c737916220>
#> 
#> $dparse_free_Action
#> <pointer: 0x78c737915680>
#> 
#> $dparse_goto_State
#> <pointer: 0x78c7379156f0>
#> 
#> $dparse_elem_symbol
#> <pointer: 0x78c737915660>
#> 
#> $dparse_sort_VecAction
#> <pointer: 0x78c7379156c0>
#> 
#> $dparse_build_LR_tables
#> <pointer: 0x78c737915750>
#> 
#> $dparse_build_scanners
#> <pointer: 0x78c737913610>
#> 
#> $dparse_state_for_declaration
#> <pointer: 0x78c73790e820>
#> 
#> $dparse_initialize_productions
#> <pointer: 0x78c73790de50>
#> 
#> $dparse_rep_EBNF
#> <pointer: 0x78c73790dc70>
#> 
#> $dparse_plus_EBNF
#> <pointer: 0x78c73790d790>
#> 
#> $dparse_star_EBNF
#> <pointer: 0x78c73790d340>
#> 
#> $dparse_conditional_EBNF
#> <pointer: 0x78c73790d110>
#> 
#> $dparse_find_pass
#> <pointer: 0x78c73790c9e0>
#> 
#> $dparse_add_pass_code
#> <pointer: 0x78c73790cbd0>
#> 
#> $dparse_add_pass
#> <pointer: 0x78c73790cab0>
#> 
#> $dparse_add_declaration
#> <pointer: 0x78c73790c8b0>
#> 
#> $dparse_dup_elem
#> <pointer: 0x78c73790c6b0>
#> 
#> $dparse_new_internal_production
#> <pointer: 0x78c73790cf70>
#> 
#> $dparse_add_global_code
#> <pointer: 0x78c73790c730>
#> 
#> $dparse_new_code
#> <pointer: 0x78c73790c690>
#> 
#> $dparse_new_token
#> <pointer: 0x78c73790c5d0>
#> 
#> $dparse_new_ident
#> <pointer: 0x78c73790c500>
#> 
#> $dparse_new_utf8_char
#> <pointer: 0x78c73790c2e0>
#> 
#> $dparse_new_string
#> <pointer: 0x78c73790bf40>
#> 
#> $dparse_new_production
#> <pointer: 0x78c73790cea0>
#> 
#> $dparse_new_declaration
#> <pointer: 0x78c73790c810>
#> 
#> $dparse_new_elem_nterm
#> <pointer: 0x78c73790b7c0>
#> 
#> $dparse_new_rule
#> <pointer: 0x78c73790b760>
#> 
#> $dparse_lookup_production
#> <pointer: 0x78c73790ce30>
#> 
#> $dparse_print_term
#> <pointer: 0x78c73790de90>
#> 
#> $dparse_print_rule
#> <pointer: 0x78c73790e100>
#> 
#> $dparse_print_states
#> <pointer: 0x78c73790e470>
#> 
#> $dparse_print_rdebug_grammar
#> <pointer: 0x78c7379106c0>
#> 
#> $dparse_print_grammar
#> <pointer: 0x78c73790e190>
#> 
#> $dparse_parse_grammar
#> <pointer: 0x78c73790f620>
#> 
#> $dparse_build_grammar
#> <pointer: 0x78c73790f7a0>
#> 
#> $dparse_free_D_Grammar
#> <pointer: 0x78c73790ee70>
#> 
#> $dparse_new_D_Grammar
#> <pointer: 0x78c73790ee20>
#> 
#> $dparse_print_scope
#> <pointer: 0x78c73790b2f0>
#> 
#> $dparse_next_D_Sym_in_Scope
#> <pointer: 0x78c73790b110>
#> 
#> $dparse_find_D_Sym_in_Scope
#> <pointer: 0x78c73790b090>
#> 
#> $dparse_current_D_Sym
#> <pointer: 0x78c73790ae10>
#> 
#> $dparse_update_additional_D_Sym
#> <pointer: 0x78c73790b1d0>
#> 
#> $dparse_update_D_Sym
#> <pointer: 0x78c73790b230>
#> 
#> $dparse_find_global_D_Sym
#> <pointer: 0x78c73790b010>
#> 
#> $dparse_find_D_Sym
#> <pointer: 0x78c73790afb0>
#> 
#> $dparse_new_D_Sym
#> <pointer: 0x78c73790ad40>
#> 
#> $dparse_free_D_Scope
#> <pointer: 0x78c73790ac10>
#> 
#> $dparse_scope_D_Scope
#> <pointer: 0x78c73790abb0>
#> 
#> $dparse_global_D_Scope
#> <pointer: 0x78c73790ab90>
#> 
#> $dparse_equiv_D_Scope
#> <pointer: 0x78c73790aa90>
#> 
#> $dparse_commit_D_Scope
#> <pointer: 0x78c73790ae50>
#> 
#> $dparse_enter_D_Scope
#> <pointer: 0x78c73790ab30>
#> 
#> $dparse_new_D_Scope
#> <pointer: 0x78c73790a9d0>
#> 
#> $dparse_parse_whitespace
#> <pointer: 0x78c73791c560>
#> 
#> $dparse_d_dup_pathname_str
#> <pointer: 0x78c73791e640>
#> 
#> $dparse_resolve_amb_greedy
#> <pointer: 0x78c73791c5f0>
#> 
#> $dparse_d_pass
#> <pointer: 0x78c73791c700>
#> 
#> $dparse_d_ws_after
#> <pointer: 0x78c737919910>
#> 
#> $dparse_d_ws_before
#> <pointer: 0x78c7379198f0>
#> 
#> $dparse_d_find_in_tree
#> <pointer: 0x78c737919890>
#> 
#> $dparse_d_get_child
#> <pointer: 0x78c737919830>
#> 
#> $dparse_d_get_number_of_children
#> <pointer: 0x78c737919870>
#> 
#> $dparse_free_D_ParseTreeBelow
#> <pointer: 0x78c73791c6c0>
#> 
#> $dparse_free_D_ParseNode
#> <pointer: 0x78c73791c9e0>
#> 
#> $dparse_dparse
#> <pointer: 0x78c73791ced0>
#> 
#> $dparse_free_D_Parser
#> <pointer: 0x78c73791c8a0>
#> 
#> $dparse_new_D_Parser
#> <pointer: 0x78c73791c7d0>
#> 
```
