# Defining Data

## Prompt 1

Using the first_addition.asm (below) file as a reference, write a program that calculates the following expression, using registers:

`A = (A + B) – (C + D).`

Assign integer values to the EAX, EBX, ECX, EDX registers.
Output the result.

## Prompt 2

Write a program that defines symbolic constants for all seven days of week.
Create an array variable that uses the symbols as initializers. Dump the
memory.

## Prompt 3

Write a program that contains a definition of each integer data type: from
BYTE and SBYTE to QWORD. Ignore TBYTE. Define some of the data as
arrays (possibly all but at least one type). The size of each array is on your
discretion. Dump the memory. 

```
INCLUDE \masm32\include\masm32rt.inc  ; for using inkey
.486
.model flat, stdcall
.STACK 1000h
ExitProcess PROTO, DwErrorCode:DWORD
WriteHex PROTO
Crlf PROTO

.DATA
  sum DWORD ?
  
.CODE
  Start:
  main PROC
   mov eax, 9
   add eax, 4
   CALL WriteHex
   CALL Crlf
   mov sum, eax
   print "Hello!", 0dh, 0ah
   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main 
```