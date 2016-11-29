# Numerical Conversion

## Prompt

Using the file first_addition.asm (below) as a reference, modify it to output more messages and to convert any decimal number by your choice to hexadecimal form 

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