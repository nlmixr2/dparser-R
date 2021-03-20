{
#include "stdio.h"
#include "dparse.h"
#include "dsymtab.h"
D_Scope *saved = 0;
}

S: def use;

def: 'a' {
  D_Scope *s = ${scope};
  ${scope} = enter_D_Scope(${scope}, ${scope});
  saved = ${scope}; 
  NEW_D_SYM(${scope}, "a", 0);
  ${scope} = enter_D_Scope(${scope}, s);
}; 

use: 'b' {
  if (find_D_Sym(${scope}, "a", 0))
    Rprintf("failed1\n");
  else
    Rprintf("succeed1\n");
  ${scope} = scope_D_Scope(${scope}, saved);
  if (find_D_Sym(${scope}, "a", 0))
    Rprintf("succeed2\n");
  else
    Rprintf("failed2\n");
};
