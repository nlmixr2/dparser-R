{
#include <stdio.h>
}

S: identifier*
  { Rprintf("identifier\n"); }
 ;

identifier: "[a-z<>=+]+";
