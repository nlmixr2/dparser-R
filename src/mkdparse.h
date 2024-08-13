 /*
  Copyright 2002-2004 John Plevyak, All Rights Reserved
*/
#ifndef _mkdparse_H_
#define _mkdparse_H_

#include <stdlib.h>
#if defined(__cplusplus)
extern "C" {
#endif

struct Grammar;

#ifndef __dparser_ptr__

void mkdparse(struct Grammar *g, char *grammar_pathname);
void mkdparse_from_string(struct Grammar *g, char *str);

#endif

#if defined(__cplusplus)
}
#endif

#endif
