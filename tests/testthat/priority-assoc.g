E : E '+' E $binary_left 1
  | E '*' E $binary_left 2
  | E '^' E $binary_right 4
  | '-' E $unary_right 3
  | E '!' $unary_left 5
  | '(' E ')'
  | 'a' | 'b' | 'c'
  ;
