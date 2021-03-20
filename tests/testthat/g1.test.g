{
#include <stdio.h>
}
S: A S 'b' | 'x';
A: [ Rprintf("speculative e-reduce A\n"); ] 
   { Rprintf("final e-reduce A\n"); };
