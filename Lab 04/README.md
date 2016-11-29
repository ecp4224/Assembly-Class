# Data Definition and Basic Loops

## Prompt 1

Use the attached file lab4Orig.asm as the reference.

Its current output is:

```
Today as stored in a double word
0
Seeing bytes in a single word
0
total bytes used: 18
Press any key to continue ...
```

Modify only data definitions (no code modification!) so that the output would be as follows:

```
Today as stored in a double word
10042016
Seeing bytes in a single word
55555
total bytes used: 22
Press any key to continue ...
```

## Prompt 2

Use a loop with indirect or indexed addressing to reverse the elements of an integer array
in place. Do not copy the elements to any other array. Do not use stack operations. Use
the `SIZEOF`, `TYPE`, `LENGTHOF` operators to make the program as flexible as possible. 