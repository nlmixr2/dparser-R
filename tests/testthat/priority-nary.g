${declare longest_match}

Spec: 'proc' Id '=' ProcExpr ';' ;

ProcExpr
  : Id
  | 'tau'
  | '(' ProcExpr ')'
  | ProcExpr '+' ProcExpr $binary_left 1
  | DataExprUnit '->' ProcExpr $right 5
  | DataExprUnit '->' ProcExpr '<>' ProcExpr $right 6
  | ProcExpr '.' ProcExpr $binary_left 9
  ;

DataExprUnit: 'true' | 'false' | Id ;

Id: "[A-Za-z_][A-Za-z_0-9]*" $term -1 ;
