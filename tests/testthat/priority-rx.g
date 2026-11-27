${declare longest_match}

statement: identifier '=' expr ';' ;

expr
  : identifier
  | number
  | '(' expr ')'
  | expr ('+' $binary_op_left 10) expr
  | expr ('-' $binary_op_left 10) expr
  | expr ('*' $binary_op_left 20) expr
  | expr ('/' $binary_op_left 20) expr
  | expr ('^' $binary_op_right 40) expr
  | ('-' $unary_op_right 30) expr
  | ('!' $unary_op_right 30) expr
  | (expr '?' $unary_op_right 5) expr
  | ((expr '?' $unary_op_right 6) expr ':' $unary_op_right 5) expr
  ;

number: "[0-9]+(\.[0-9]+)?" $term -1 ;
identifier: "[A-Za-z_][A-Za-z_0-9.]*" $term -1 ;
