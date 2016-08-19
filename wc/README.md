
A clone of the "wc" Unix utility.

Bugs:

 - It assumes that all lines are newline-terminated; it gets the byte count wrong by 1 if the last line isn't.
 - It does not detect line overflow (line longer than 200 chars)
 - It does not support command line switches
 - It does not read from standard input