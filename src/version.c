/*
 Copyright 2002-2004 John Plevyak, All Rights Reserved
*/
#include "d.h"

const char *git_commit_id = "$Id: 4ab9d43046e5d22ffb365ec5f5184a7cfee09b30 $";

/* v must point to a buffer of at least 128 bytes */
void d_version(char *v) {
  int n = snprintf(v, 128, "%d.%d", D_MAJOR_VERSION, D_MINOR_VERSION);
  if (n < 0 || n >= 128) return;
  if (strlen(git_commit_id) > 4) {
    char scommit[43];
    strncpy(scommit, &git_commit_id[5], 42);
    scommit[40] = 0;
    snprintf(v + n, 128 - n, ".%s", scommit);
  }
}
