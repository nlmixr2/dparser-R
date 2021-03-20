{
#include <stdio.h>
}
A: ID ( ',' ID { Rprintf( "moreIDs\n" ); } )* ';' ;
ID: "[a-z]+" { Rprintf( "ID\n" ); } ;
