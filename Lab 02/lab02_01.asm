INCLUDE \masm32\include\masm32rt.inc  ; for using inkey
INCLUDE \masm32\include\Irvine32.inc
INCLUDELIB \masm32\lib\Irvine32.lib
.486
.model flat, stdcall
.STACK 1000h
ExitProcess PROTO, DwErrorCode:DWORD
WriteHex PROTO
Crlf PROTO

.DATA
  A DWORD 1
  B DWORD 2
  C_ DWORD 3
  D DWORD 4
  
.CODE
  Start:
  main PROC
   mov eax, A
   mov ebx, B
   mov ecx, C_
   mov edx, D
   
   add ecx, edx ; (C + D)
   add eax, ebx ; (A + B)
   sub eax, ecx
   mov A, eax

   printf("A = %i\n", A)
   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main 