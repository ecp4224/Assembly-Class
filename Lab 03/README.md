# Data Definition and Transfer

## Prompt 1

Define an array of the length 6 with the elements of WORD type. Initialize the first and
the last of them with the same value of your choice; leave the remaining four
uninitialized 

## Prompt 2

Use the following data definitions:

```
.data
 three DWORD … ; initialize as you want
 bigEndian BYTE 13h, 57h, 9Bh, 0DFh
littleEndian DWORD ?
 myString BYTE “ABCDE“, 0
```

a) (30 pts) Write a sequence of MOV instructions that will exchange the upper and
lower words in a doubleword variable named three.

b) (30 pts) Add a code that copies the value from bigEndian to littleEndian,
reversing the order of the bytes. The resulting littleEndian’s 32-bit value is
understood to be 13579BDF hexadecimal. Make sure not to change the values in
bigEndian

c) (20 pts) add a set of instructions that changes the value of myString to
“HELLO”,0

Output the numerical values by moving this value to EAX and using the instruction

 `CALL WriteHex`. Use `CALL Crlf` for moving cursor on the next line.
 Output the value of myString with the following instructions:

``` 
MOV edx, OFFSET myString
CALL WriteString
```