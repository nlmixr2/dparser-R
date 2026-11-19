${declare longest_match}

Spec: 'proc' Id '=' ProcExpr ';' ;

ProcExpr
  : Id
  | 'tau'
  | '(' ProcExpr ')'
  | ProcExpr ('+' $binary_op_left 1) ProcExpr
  | (DataExprUnit '->' $unary_op_right 5) ProcExpr
  | ((DataExprUnit '->' $unary_op_right 6) ProcExpr
                   '<>' $unary_op_right 5) ProcExpr
  | ProcExpr ('.' $binary_op_right 9) ProcExpr
  ;

DataExprUnit: 'true' | 'false' | Id ;

Id: "[A-Za-z_][A-Za-z_0-9]*" $term -1 ;
