{
#include <stdio.h>
}
A: ID moreIDs* ';' ;
moreIDs: ',' ID { Rprintf( "moreIDs\n" ); } ;
ID: "[a-z]+" { Rprintf( "ID\n" ); } ;
