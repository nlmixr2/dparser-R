/*
  Header file for using internal C-level dparser functions in dparser-R (generated).
*/
#ifndef __dparserPtr_H__
#define __dparserPtr_H__
#define __dparser_ptr__
#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <Rconfig.h>
#include <R_ext/Rdynload.h>
#include "gramgram.h"
#include "d.h"
#include "mkdparse.h"
#include "dparse.h"
#include "read_binary.h"


#if defined(__cplusplus)
extern "C" {
#endif

  typedef  D_Parser *(*new_D_Parser_type)(struct D_ParserTables*, int);
  extern new_D_Parser_type new_D_Parser;

  typedef  void (*free_D_Parser_type)(D_Parser*);
  extern free_D_Parser_type free_D_Parser;

  typedef  D_ParseNode *(*dparse_type)(D_Parser*, char*, int);
  extern dparse_type dparse;

  typedef  void (*free_D_ParseNode_type)(D_Parser*, D_ParseNode*);
  extern free_D_ParseNode_type free_D_ParseNode;

  typedef  void (*free_D_ParseTreeBelow_type)(D_Parser*, D_ParseNode*);
  extern free_D_ParseTreeBelow_type free_D_ParseTreeBelow;

  typedef  int (*d_get_number_of_children_type)(D_ParseNode*);
  extern d_get_number_of_children_type d_get_number_of_children;

  typedef  D_ParseNode *(*d_get_child_type)(D_ParseNode*, int);
  extern d_get_child_type d_get_child;

  typedef  D_ParseNode *(*d_find_in_tree_type)(D_ParseNode*, int);
  extern d_find_in_tree_type d_find_in_tree;

  typedef  char  * (*d_ws_before_type)(D_Parser*, D_ParseNode* );
  extern d_ws_before_type d_ws_before;

  typedef  char   *  (*d_ws_after_type)(D_Parser*, D_ParseNode*  );
  extern d_ws_after_type d_ws_after;

  typedef  void (*d_pass_type)(D_Parser*, D_ParseNode*, int);
  extern d_pass_type d_pass;

  typedef  int (*resolve_amb_greedy_type)(D_Parser*, int, D_ParseNode**);
  extern resolve_amb_greedy_type resolve_amb_greedy;

  typedef  char *(*d_dup_pathname_str_type)(const char*);
  extern d_dup_pathname_str_type d_dup_pathname_str;

  typedef  void (*parse_whitespace_type)(struct D_Parser*, d_loc_t*, void**);
  extern parse_whitespace_type parse_whitespace;

  typedef  D_Scope *(*new_D_Scope_type)(D_Scope*);
  extern new_D_Scope_type new_D_Scope;

  typedef  D_Scope *(*enter_D_Scope_type)(D_Scope*, D_Scope*);
  extern enter_D_Scope_type enter_D_Scope;

  typedef  D_Scope *(*commit_D_Scope_type)(D_Scope*);
  extern commit_D_Scope_type commit_D_Scope;

  typedef  D_Scope *(*equiv_D_Scope_type)(D_Scope*);
  extern equiv_D_Scope_type equiv_D_Scope;

  typedef  D_Scope *(*global_D_Scope_type)(D_Scope*);
  extern global_D_Scope_type global_D_Scope;

  typedef  D_Scope *(*scope_D_Scope_type)(D_Scope*, D_Scope*);
  extern scope_D_Scope_type scope_D_Scope;

  typedef  void (*free_D_Scope_type)(D_Scope*, int);
  extern free_D_Scope_type free_D_Scope;

  typedef  D_Sym *(*new_D_Sym_type)(D_Scope*, char*, char*, int);
  extern new_D_Sym_type new_D_Sym;

  typedef  D_Sym *(*find_D_Sym_type)(D_Scope*, char*, char*);
  extern find_D_Sym_type find_D_Sym;

  typedef  D_Sym *(*find_global_D_Sym_type)(D_Scope*, char*, char*);
  extern find_global_D_Sym_type find_global_D_Sym;

  typedef  D_Sym *(*update_D_Sym_type)(D_Sym*, D_Scope**, int);
  extern update_D_Sym_type update_D_Sym;

  typedef  D_Sym *(*update_additional_D_Sym_type)(D_Scope*, D_Sym*, int);
  extern update_additional_D_Sym_type update_additional_D_Sym;

  typedef  D_Sym *(*current_D_Sym_type)(D_Scope*, D_Sym*);
  extern current_D_Sym_type current_D_Sym;

  typedef  D_Sym *(*find_D_Sym_in_Scope_type)(D_Scope*, D_Scope*, char*, char*);
  extern find_D_Sym_in_Scope_type find_D_Sym_in_Scope;

  typedef  D_Sym *(*next_D_Sym_in_Scope_type)(D_Scope**, D_Sym**);
  extern next_D_Sym_in_Scope_type next_D_Sym_in_Scope;

  typedef  void (*print_scope_type)(D_Scope*);
  extern print_scope_type print_scope;

  typedef  Grammar *(*new_D_Grammar_type)(char*);
  extern new_D_Grammar_type new_D_Grammar;

  typedef  void (*free_D_Grammar_type)(Grammar*);
  extern free_D_Grammar_type free_D_Grammar;

  typedef  int (*build_grammar_type)(Grammar*);
  extern build_grammar_type build_grammar;

  typedef  int (*parse_grammar_type)(Grammar*, char*, char*);
  extern parse_grammar_type parse_grammar;

  typedef  void (*print_grammar_type)(Grammar*);
  extern print_grammar_type print_grammar;

  typedef  void (*print_rdebug_grammar_type)(Grammar*, char*);
  extern print_rdebug_grammar_type print_rdebug_grammar;

  typedef  void (*print_states_type)(Grammar*);
  extern print_states_type print_states;

  typedef  void (*print_rule_type)(Rule*);
  extern print_rule_type print_rule;

  typedef  void (*print_term_type)(Term*);
  extern print_term_type print_term;

  typedef  Production *(*lookup_production_type)(Grammar*, char*, uint);
  extern lookup_production_type lookup_production;

  typedef  Rule *(*new_rule_type)(Grammar*, Production*);
  extern new_rule_type new_rule;

  typedef  Elem *(*new_elem_nterm_type)(Production*, Rule*);
  extern new_elem_nterm_type new_elem_nterm;

  typedef  void (*new_declaration_type)(Grammar*, Elem*, uint);
  extern new_declaration_type new_declaration;

  typedef  Production *(*new_production_type)(Grammar*, char*);
  extern new_production_type new_production;

  typedef  Elem *(*new_string_type)(Grammar*, char*, char*, Rule*);
  extern new_string_type new_string;

  typedef  Elem *(*new_utf8_char_type)(Grammar*, char*, char*, Rule*);
  extern new_utf8_char_type new_utf8_char;

  typedef  Elem *(*new_ident_type)(char*, char*, Rule*);
  extern new_ident_type new_ident;

  typedef  void (*new_token_type)(Grammar*, char*, char*);
  extern new_token_type new_token;

  typedef  Elem *(*new_code_type)(Grammar*, char*, char*, Rule*);
  extern new_code_type new_code;

  typedef  void (*add_global_code_type)(Grammar*, char*, char*, int);
  extern add_global_code_type add_global_code;

  typedef  Production *(*new_internal_production_type)(Grammar*, Production*);
  extern new_internal_production_type new_internal_production;

  typedef  Elem *(*dup_elem_type)(Elem*, Rule*);
  extern dup_elem_type dup_elem;

  typedef  void (*add_declaration_type)(Grammar*, char*, char*, uint, uint);
  extern add_declaration_type add_declaration;

  typedef  void (*add_pass_type)(Grammar*, char*, char*, uint, uint);
  extern add_pass_type add_pass;

  typedef  void (*add_pass_code_type)(Grammar*, Rule*, char*, char*, char*, char*, uint, uint);
  extern add_pass_code_type add_pass_code;

  typedef  D_Pass *(*find_pass_type)(Grammar*, char*, char*);
  extern find_pass_type find_pass;

  typedef  void   (*conditional_EBNF_type)(Grammar* );
  extern conditional_EBNF_type conditional_EBNF;

  typedef  void (*star_EBNF_type)(Grammar*);
  extern star_EBNF_type star_EBNF;

  typedef  void (*plus_EBNF_type)(Grammar*);
  extern plus_EBNF_type plus_EBNF;

  typedef  void (*rep_EBNF_type)(Grammar*, int, int);
  extern rep_EBNF_type rep_EBNF;

  typedef  void (*initialize_productions_type)(Grammar*);
  extern initialize_productions_type initialize_productions;

  typedef  uint (*state_for_declaration_type)(Grammar*, uint);
  extern state_for_declaration_type state_for_declaration;

  typedef  void (*build_scanners_type)(struct Grammar*);
  extern build_scanners_type build_scanners;

  typedef  void (*build_LR_tables_type)(Grammar*);
  extern build_LR_tables_type build_LR_tables;

  typedef  void (*sort_VecAction_type)(VecAction*);
  extern sort_VecAction_type sort_VecAction;

  typedef  uint (*elem_symbol_type)(Grammar*, Elem*);
  extern elem_symbol_type elem_symbol;

  typedef  State *(*goto_State_type)(State*, Elem*);
  extern goto_State_type goto_State;

  typedef  void (*free_Action_type)(Action*);
  extern free_Action_type free_Action;

  typedef  void (*mkdparse_type)(struct Grammar*, char*);
  extern mkdparse_type mkdparse;

  typedef  void (*mkdparse_from_string_type)(struct Grammar*, char*);
  extern mkdparse_from_string_type mkdparse_from_string;

  typedef  D_ParseNode *(*ambiguity_count_fn_type)(D_Parser*, int, D_ParseNode**);
  extern ambiguity_count_fn_type ambiguity_count_fn;

  typedef  BinaryTables *(*read_binary_tables_type)(char*, D_ReductionCode, D_ReductionCode);
  extern read_binary_tables_type read_binary_tables;

  typedef  BinaryTables *(*read_binary_tables_from_file_type)(FILE*, D_ReductionCode, D_ReductionCode);
  extern read_binary_tables_from_file_type read_binary_tables_from_file;

  typedef  BinaryTables *(*read_binary_tables_from_string_type)(unsigned char*, D_ReductionCode, D_ReductionCode);
  extern read_binary_tables_from_string_type read_binary_tables_from_string;

  typedef  void (*free_BinaryTables_type)(BinaryTables*);
  extern free_BinaryTables_type free_BinaryTables;

  typedef  int (*scan_buffer_type)(d_loc_t*, D_State*, ShiftResult*);
  extern scan_buffer_type scan_buffer;

  typedef  void (*vec_add_internal_type)(void*, void*);
  extern vec_add_internal_type vec_add_internal;

  typedef  int (*vec_eq_type)(void*, void*);
  extern vec_eq_type vec_eq;

  typedef  int (*set_find_type)(void*, void*);
  extern set_find_type set_find;

  typedef  int (*set_add_type)(void*, void*);
  extern set_add_type set_add;

  typedef  int (*set_union_type)(void*, void*);
  extern set_union_type set_union;

  typedef  void (*set_union_fn_type)(void*, void*, hash_fns_t*);
  extern set_union_fn_type set_union_fn;

  typedef  void (*set_to_vec_type)(void*);
  extern set_to_vec_type set_to_vec;

  typedef  int (*buf_read_type)(const char*, char**, int*);
  extern buf_read_type buf_read;

  typedef  char *(*sbuf_read_type)(const char*);
  extern sbuf_read_type sbuf_read;

  typedef  char *(*dup_str_type)(const char*, const char*);
  extern dup_str_type dup_str;

  typedef  uint (*strhashl_type)(const char*, int);
  extern strhashl_type strhashl;

  typedef  void (*d_free_type)(void*);
  extern d_free_type d_free;

  typedef  void (*int_list_diff_type)(int*, int*, int*);
  extern int_list_diff_type int_list_diff;

  typedef  void (*int_list_intersect_type)(int*, int*, int*);
  extern int_list_intersect_type int_list_intersect;

  typedef  int *(*int_list_dup_type)(int*);
  extern int_list_dup_type int_list_dup;

  typedef  char *(*escape_string_type)(char*);
  extern escape_string_type escape_string;

  typedef  char *(*escape_string_single_quote_type)(char*);
  extern escape_string_single_quote_type escape_string_single_quote;

  typedef  int (*write_c_tables_type)(Grammar*);
  extern write_c_tables_type write_c_tables;

  typedef  int (*write_binary_tables_type)(Grammar*);
  extern write_binary_tables_type write_binary_tables;

  typedef  int (*write_binary_tables_to_file_type)(Grammar*, FILE*);
  extern write_binary_tables_to_file_type write_binary_tables_to_file;

  typedef  int (*write_binary_tables_to_string_type)(Grammar*, unsigned char**, unsigned int*);
  extern write_binary_tables_to_string_type write_binary_tables_to_string;

  typedef  void (*set_d_use_r_headers_type)(int);
  extern set_d_use_r_headers_type set_d_use_r_headers;

  typedef  void (*set_d_rdebug_grammar_level_type)(int);
  extern set_d_rdebug_grammar_level_type set_d_rdebug_grammar_level;

  typedef  void (*set_d_use_file_name_type)(int);
  extern set_d_use_file_name_type set_d_use_file_name;

  typedef  void (*set_d_verbose_level_type)(int);
  extern set_d_verbose_level_type set_d_verbose_level;

  typedef  void (*set_d_debug_level_type)(int);
  extern set_d_debug_level_type set_d_debug_level;

  typedef  int (*get_d_use_r_headers_type)(void);
  extern get_d_use_r_headers_type get_d_use_r_headers;

  typedef  int (*get_d_rdebug_grammar_level_type)(void);
  extern get_d_rdebug_grammar_level_type get_d_rdebug_grammar_level;

  typedef  int (*get_d_use_file_name_type)(void);
  extern get_d_use_file_name_type get_d_use_file_name;

  typedef  int (*get_d_verbose_level_type)(void);
  extern get_d_verbose_level_type get_d_verbose_level;

  typedef  int (*get_d_debug_level_type)(void);
  extern get_d_debug_level_type get_d_debug_level;

  typedef  void (*set_d_file_name_type)(char*);
  extern set_d_file_name_type set_d_file_name;

  static inline void setDparserPtr0(SEXP p) {
    if (set_d_file_name == NULL) {
      /* __freeP = (__freeP_type)(R_ExternalPtrAddr(VECTOR_ELT(p, 0))); */
      /* dparse_sexp = (dparse_sexp_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 1))); */
      set_d_file_name = (set_d_file_name_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 2)));
      get_d_debug_level = (get_d_debug_level_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 3)));
      get_d_verbose_level = (get_d_verbose_level_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 4)));
      get_d_use_file_name = (get_d_use_file_name_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 5)));
      get_d_rdebug_grammar_level = (get_d_rdebug_grammar_level_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 6)));
      get_d_use_r_headers = (get_d_use_r_headers_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 7)));
      set_d_debug_level = (set_d_debug_level_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 8)));
      set_d_verbose_level = (set_d_verbose_level_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 9)));
      set_d_use_file_name = (set_d_use_file_name_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 10)));
      set_d_rdebug_grammar_level = (set_d_rdebug_grammar_level_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 11)));
      set_d_use_r_headers = (set_d_use_r_headers_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 12)));
      write_binary_tables_to_string = (write_binary_tables_to_string_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 13)));
      write_binary_tables_to_file = (write_binary_tables_to_file_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 14)));
      write_binary_tables = (write_binary_tables_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 15)));
      write_c_tables = (write_c_tables_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 16)));
      escape_string_single_quote = (escape_string_single_quote_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 17)));
      escape_string = (escape_string_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 18)));
      int_list_dup = (int_list_dup_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 19)));
      int_list_intersect = (int_list_intersect_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 20)));
      int_list_diff = (int_list_diff_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 21)));
      d_free = (d_free_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 22)));
      strhashl = (strhashl_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 23)));
      dup_str = (dup_str_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 24)));
      sbuf_read = (sbuf_read_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 25)));
      buf_read = (buf_read_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 26)));
      set_to_vec = (set_to_vec_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 27)));
      set_union_fn = (set_union_fn_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 28)));
      set_union = (set_union_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 29)));
      set_add = (set_add_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 30)));
      set_find = (set_find_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 31)));
      vec_eq = (vec_eq_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 32)));
      vec_add_internal = (vec_add_internal_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 33)));
      scan_buffer = (scan_buffer_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 34)));
      free_BinaryTables = (free_BinaryTables_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 35)));
      read_binary_tables_from_string = (read_binary_tables_from_string_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 36)));
      read_binary_tables_from_file = (read_binary_tables_from_file_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 37)));
      read_binary_tables = (read_binary_tables_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 38)));
      ambiguity_count_fn = (ambiguity_count_fn_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 39)));
      mkdparse_from_string = (mkdparse_from_string_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 40)));
      mkdparse = (mkdparse_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 41)));
      free_Action = (free_Action_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 42)));
      goto_State = (goto_State_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 43)));
      elem_symbol = (elem_symbol_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 44)));
      sort_VecAction = (sort_VecAction_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 45)));
      build_LR_tables = (build_LR_tables_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 46)));
      build_scanners = (build_scanners_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 47)));
      state_for_declaration = (state_for_declaration_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 48)));
      initialize_productions = (initialize_productions_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 49)));
      rep_EBNF = (rep_EBNF_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 50)));
      plus_EBNF = (plus_EBNF_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 51)));
      star_EBNF = (star_EBNF_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 52)));
      conditional_EBNF = (conditional_EBNF_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 53)));
      find_pass = (find_pass_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 54)));
      add_pass_code = (add_pass_code_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 55)));
      add_pass = (add_pass_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 56)));
      add_declaration = (add_declaration_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 57)));
      dup_elem = (dup_elem_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 58)));
      new_internal_production = (new_internal_production_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 59)));
      add_global_code = (add_global_code_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 60)));
      new_code = (new_code_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 61)));
      new_token = (new_token_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 62)));
      new_ident = (new_ident_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 63)));
      new_utf8_char = (new_utf8_char_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 64)));
      new_string = (new_string_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 65)));
      new_production = (new_production_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 66)));
      new_declaration = (new_declaration_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 67)));
      new_elem_nterm = (new_elem_nterm_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 68)));
      new_rule = (new_rule_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 69)));
      lookup_production = (lookup_production_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 70)));
      print_term = (print_term_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 71)));
      print_rule = (print_rule_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 72)));
      print_states = (print_states_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 73)));
      print_rdebug_grammar = (print_rdebug_grammar_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 74)));
      print_grammar = (print_grammar_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 75)));
      parse_grammar = (parse_grammar_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 76)));
      build_grammar = (build_grammar_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 77)));
      free_D_Grammar = (free_D_Grammar_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 78)));
      new_D_Grammar = (new_D_Grammar_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 79)));
      print_scope = (print_scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 80)));
      next_D_Sym_in_Scope = (next_D_Sym_in_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 81)));
      find_D_Sym_in_Scope = (find_D_Sym_in_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 82)));
      current_D_Sym = (current_D_Sym_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 83)));
      update_additional_D_Sym = (update_additional_D_Sym_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 84)));
      update_D_Sym = (update_D_Sym_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 85)));
      find_global_D_Sym = (find_global_D_Sym_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 86)));
      find_D_Sym = (find_D_Sym_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 87)));
      new_D_Sym = (new_D_Sym_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 88)));
      free_D_Scope = (free_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 89)));
      scope_D_Scope = (scope_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 90)));
      global_D_Scope = (global_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 91)));
      equiv_D_Scope = (equiv_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 92)));
      commit_D_Scope = (commit_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 93)));
      enter_D_Scope = (enter_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 94)));
      new_D_Scope = (new_D_Scope_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 95)));
      parse_whitespace = (parse_whitespace_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 96)));
      d_dup_pathname_str = (d_dup_pathname_str_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 97)));
      resolve_amb_greedy = (resolve_amb_greedy_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 98)));
      d_pass = (d_pass_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 99)));
      d_ws_after = (d_ws_after_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 100)));
      d_ws_before = (d_ws_before_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 101)));
      d_find_in_tree = (d_find_in_tree_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 102)));
      d_get_child = (d_get_child_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 103)));
      d_get_number_of_children = (d_get_number_of_children_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 104)));
      free_D_ParseTreeBelow = (free_D_ParseTreeBelow_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 105)));
      free_D_ParseNode = (free_D_ParseNode_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 106)));
      dparse = (dparse_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 107)));
      free_D_Parser = (free_D_Parser_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 108)));
      new_D_Parser = (new_D_Parser_type)(R_ExternalPtrAddrFn(VECTOR_ELT(p, 109)));
    }
  }

static inline  void
  d_fail(const char *str, ...) {
    char nstr[256];
    char outstr[256*2];
    va_list ap;
    va_start(ap, str);
    snprintf(nstr, 255, "Parser Fail: %s", str);
    vsnprintf(outstr, 256*2, nstr, ap);
    va_end(ap);
    Rf_error("%s", outstr);
  }

static inline void
  d_warn(const char *str, ...) {
    char nstr[256];
    char outstr[256*2];
    va_list ap;
    va_start(ap, str);
    snprintf(nstr, 255, "%s", str);
    vsnprintf(outstr, 256*2, nstr, ap);
    va_end(ap);
    Rf_warning("%s", outstr);
  }
#define dparserPtrIni set_d_file_name_type set_d_file_name;             \
  get_d_debug_level_type get_d_debug_level;                             \
  get_d_verbose_level_type get_d_verbose_level;                         \
  get_d_use_file_name_type get_d_use_file_name;                         \
  get_d_rdebug_grammar_level_type get_d_rdebug_grammar_level;           \
  get_d_use_r_headers_type get_d_use_r_headers;                         \
  set_d_debug_level_type set_d_debug_level;                             \
  set_d_verbose_level_type set_d_verbose_level;                         \
  set_d_use_file_name_type set_d_use_file_name;                         \
  set_d_rdebug_grammar_level_type set_d_rdebug_grammar_level;           \
  set_d_use_r_headers_type set_d_use_r_headers;                         \
  write_binary_tables_to_string_type write_binary_tables_to_string;     \
  write_binary_tables_to_file_type write_binary_tables_to_file;         \
  write_binary_tables_type write_binary_tables;                         \
  write_c_tables_type write_c_tables;                                   \
  escape_string_single_quote_type escape_string_single_quote;           \
  escape_string_type escape_string;                                     \
  int_list_dup_type int_list_dup;                                       \
  int_list_intersect_type int_list_intersect;                           \
  int_list_diff_type int_list_diff;                                     \
  d_free_type d_free;                                                   \
  strhashl_type strhashl;                                               \
  dup_str_type dup_str;                                                 \
  sbuf_read_type sbuf_read;                                             \
  buf_read_type buf_read;                                               \
  set_to_vec_type set_to_vec;                                           \
  set_union_fn_type set_union_fn;                                       \
  set_union_type set_union;                                             \
  set_add_type set_add;                                                 \
  set_find_type set_find;                                               \
  vec_eq_type vec_eq;                                                   \
  vec_add_internal_type vec_add_internal;                               \
  scan_buffer_type scan_buffer;                                         \
  free_BinaryTables_type free_BinaryTables;                             \
  read_binary_tables_from_string_type read_binary_tables_from_string;   \
  read_binary_tables_from_file_type read_binary_tables_from_file;       \
  read_binary_tables_type read_binary_tables;                           \
  ambiguity_count_fn_type ambiguity_count_fn;                           \
  mkdparse_from_string_type mkdparse_from_string;                       \
  mkdparse_type mkdparse;                                               \
  free_Action_type free_Action;                                         \
  goto_State_type goto_State;                                           \
  elem_symbol_type elem_symbol;                                         \
  sort_VecAction_type sort_VecAction;                                   \
  build_LR_tables_type build_LR_tables;                                 \
  build_scanners_type build_scanners;                                   \
  state_for_declaration_type state_for_declaration;                     \
  initialize_productions_type initialize_productions;                   \
  rep_EBNF_type rep_EBNF;                                               \
  plus_EBNF_type plus_EBNF;                                             \
  star_EBNF_type star_EBNF;                                             \
  conditional_EBNF_type conditional_EBNF;                               \
  find_pass_type find_pass;                                             \
  add_pass_code_type add_pass_code;                                     \
  add_pass_type add_pass;                                               \
  add_declaration_type add_declaration;                                 \
  dup_elem_type dup_elem;                                               \
  new_internal_production_type new_internal_production;                 \
  add_global_code_type add_global_code;                                 \
  new_code_type new_code;                                               \
  new_token_type new_token;                                             \
  new_ident_type new_ident;                                             \
  new_utf8_char_type new_utf8_char;                                     \
  new_string_type new_string;                                           \
  new_production_type new_production;                                   \
  new_declaration_type new_declaration;                                 \
  new_elem_nterm_type new_elem_nterm;                                   \
  new_rule_type new_rule;                                               \
  lookup_production_type lookup_production;                             \
  print_term_type print_term;                                           \
  print_rule_type print_rule;                                           \
  print_states_type print_states;                                       \
  print_rdebug_grammar_type print_rdebug_grammar;                       \
  print_grammar_type print_grammar;                                     \
  parse_grammar_type parse_grammar;                                     \
  build_grammar_type build_grammar;                                     \
  free_D_Grammar_type free_D_Grammar;                                   \
  new_D_Grammar_type new_D_Grammar;                                     \
  print_scope_type print_scope;                                         \
  next_D_Sym_in_Scope_type next_D_Sym_in_Scope;                         \
  find_D_Sym_in_Scope_type find_D_Sym_in_Scope;                         \
  current_D_Sym_type current_D_Sym;                                     \
  update_additional_D_Sym_type update_additional_D_Sym;                 \
  update_D_Sym_type update_D_Sym;                                       \
  find_global_D_Sym_type find_global_D_Sym;                             \
  find_D_Sym_type find_D_Sym;                                           \
  new_D_Sym_type new_D_Sym;                                             \
  free_D_Scope_type free_D_Scope;                                       \
  scope_D_Scope_type scope_D_Scope;                                     \
  global_D_Scope_type global_D_Scope;                                   \
  equiv_D_Scope_type equiv_D_Scope;                                     \
  commit_D_Scope_type commit_D_Scope;                                   \
  enter_D_Scope_type enter_D_Scope;                                     \
  new_D_Scope_type new_D_Scope;                                         \
  parse_whitespace_type parse_whitespace;                               \
  d_dup_pathname_str_type d_dup_pathname_str;                           \
  resolve_amb_greedy_type resolve_amb_greedy;                           \
  d_pass_type d_pass;                                                   \
  d_ws_after_type d_ws_after;                                           \
  d_ws_before_type d_ws_before;                                         \
  d_find_in_tree_type d_find_in_tree;                                   \
  d_get_child_type d_get_child;                                         \
  d_get_number_of_children_type d_get_number_of_children;               \
  free_D_ParseTreeBelow_type free_D_ParseTreeBelow;                     \
  free_D_ParseNode_type free_D_ParseNode;                               \
  dparse_type dparse;                                                   \
  free_D_Parser_type free_D_Parser;                                     \
  new_D_Parser_type new_D_Parser;                                       \
  SEXP iniDparserPtr(SEXP ptr) {                                        \
    setDparserPtr0(ptr);                                                \
    return R_NilValue;                                                  \
  }

#undef __dparser_ptr__
#if defined(__cplusplus)
}
#endif
#endif
