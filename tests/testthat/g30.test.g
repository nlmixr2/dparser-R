{
#include "stdio.h"
}

S: A { Rprintf("."); } B;
A: 'a' { Rprintf("a"); };
B: 'b' { Rprintf("b"); };
