{
#include "stdio.h"
#include "string.h"
#include "stdlib.h"
char *xdup(char *s, char *e) {
  char *ss = malloc( e - s + 2 );
  memcpy(ss, s, e-s);
  ss[e-s] = 0;
  return ss;
}
}
top: ( block explicit_space? )+;
explicit_space : "[ \n]+";
block : para { Rprintf("BLOCK(%s)\n", xdup($n.start_loc.s, $n.end)); }
      | list { Rprintf("BLOCK(%s)\n", xdup($n.start_loc.s, $n.end)); };
list : list_item+ { Rprintf("LIST(%s)\n", xdup($n.start_loc.s, $n.end)); };
list_item : "%?---" para_within_list+ { Rprintf("ITEM(%s)\n", xdup($n.start_loc.s, $n.end)); };
para_within_list : "[a-zA-Z0-9 ,]+\." { Rprintf("PARA(%s)\n", xdup($n.start_loc.s, $n.end)); };
para : '%' para_within_list { Rprintf("BARE\n"); };
whitespace: "[\t\n]";
