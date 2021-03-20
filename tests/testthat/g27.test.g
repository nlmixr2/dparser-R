{
#include <stdio.h>
}
S: A+;
A: 'a' B* { 
  int i; 
  Rprintf("[");
  for (i = 0; i < d_get_number_of_children(&$n1); i++)
    Rprintf("(%c)", *d_get_child(&$n1, i)->start_loc.s);
  Rprintf("]\n");
};
B: 'b' | 'B'; 
