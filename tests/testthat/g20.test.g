{
#include <stdio.h>
}
${tokenize all_matches A}
A: ID ( ',' ID { Rprintf( "moreIDs\n" ); } )* ';' ;
ID: "[a-z]+" { Rprintf( "ID\n" ); } ;
