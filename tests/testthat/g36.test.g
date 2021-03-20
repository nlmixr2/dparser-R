{
#include <stdio.h>
}

${declare all_matches S}
${declare longest_match do}

P: S*;

S: do identifier
  { Rprintf("do identifier\n"); }
 | identifier
  { Rprintf("identifier\n"); }
 | identifierX
  { Rprintf("identifierX\n"); }
 ;

do ::= 'do';
identifier: "[a-z]+" $term -1;
identifierX: "[a-z]+X" $term -1;
