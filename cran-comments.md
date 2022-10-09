# Note

This is a binary dependency of a few packages and will break them without a rebuild of the packages.

I will be submitting the packages I am responsible for, and Wenping Wang was made aware for the packages
he is responsible for.

# Comments

Matthew,

You submitted too soon, so the incoming check systems did not have
-Wstrict-prototypes turned on yet, and did not catch the remaining

Found the following significant warnings:
  lr.c:27:15: warning: function declaration isn’t a prototype [-Wstrict-prototypes]

Should be in place now, can you please fix the remaining warning too?

* Fixed

