{
#include <stdio.h>
}

${declare longest_match identifier}

P: S*;

S: 'do' identifier
  { Rprintf("do identifier\n"); }
 | identifier
  { Rprintf("identifier\n"); }
 | identifierX
  { Rprintf("identifierX\n"); }
 ;

identifier: "[a-z]+" $term -1;
identifierX: "[a-z]+X" $term -1;
