{
#include "stdio.h"
#include "string.h"
#include "stdlib.h"
}
top: A B C D;
A: 'A';
B: 'B';
C: 'C' { Rprintf("%i %i\n", $n.start_loc.line, $n.start_loc.col ); };
D: 'D';
whitespace: "[\t\n ]*";
