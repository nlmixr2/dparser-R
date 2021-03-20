{
#include <stdio.h>
}
${declare all_matches A}
A: ID moreIDs* ';' ;
moreIDs: ',' ID { Rprintf( "moreIDs\n" ); } ;
ID: "[a-z]+" { Rprintf( "ID\n" ); } ;
