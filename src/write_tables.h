#if defined(__cplusplus)
extern "C" {
#endif
/*
  Copyright 2002-2004 John Plevyak, All Rights Reserved
*/

#ifndef _write_tables_H_
#define _write_tables_H_
#ifndef __dparser_ptr__
int write_c_tables(Grammar *g);
int write_binary_tables(Grammar *g);
int write_binary_tables_to_file(Grammar *g, FILE *fp);
int write_binary_tables_to_string(Grammar *g, unsigned char **str, unsigned int *str_len);
#endif

#endif
#if defined(__cplusplus)
}
#endif
