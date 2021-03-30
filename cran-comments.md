> Found the following significant warnings:
>   write_tables.c:1136:15: warning: ‘sprintf’ argument 3 may overlap
> destination object ‘xx’ [-Wrestrict]
>   gram.c:409:3: warning: null destination pointer [-Wformat-overflow=]

# Fixes for write_tables:

To ensure write_tables does not overlap use snprintf()

# Fixes for gram.c

This occurs when printing to a recently allocated character string.  I
added a check to make sure that the memory was allocated.  If it was
not allocated, error out. 


# Reproducible Environment

I could not reproduce these warnings on my gcc test environment, so I
cannot test if these were fixed.

If these fixes still produce errors, please provide information on the
gcc test environment so I can fix these issues for CRAN.


