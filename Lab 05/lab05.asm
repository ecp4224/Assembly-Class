INCLUDE \masm32\include\masm32rt.inc  ; for using inkey
INCLUDE \masm32\include\Irvine32.inc
INCLUDELIB \masm32\lib\Irvine32.lib
.486
; .model flat, stdcall
.STACK 1000h
ExitProcess PROTO, DwErrorCode:DWORD
WriteHex PROTO
Crlf PROTO

.DATA
arrayWords WORD 11A1h, 22B3h, 33A5h, 44B7h, 55D8h, 66C6h, 77D4h
LEN = LENGTHOF arrayWords

  
.CODE
  
  main PROC
  mov ecx, 8
  Start:
   push ecx
   
   mov ecx, LEN
   mov esi, 0
   mov eax, 0
   
   Print:
      mov ax, arrayWords[esi]
      CALL WriteHex
      mov eax, " "
      CALL WriteChar
      add esi, TYPE arrayWords
      Loop Print

   CALL Crlf

   mov eax, 0 ; Clear eax
   
   mov ecx, LEN
   mov esi, SIZEOF arrayWords
   sub esi, TYPE arrayWords
   mov ax, arrayWords[esi] ; Remember the last element of the array for later
   sub esi, TYPE arrayWords

   Order:
      mov bx, arrayWords[esi]
      add esi, TYPE arrayWords ; Go foward one index
      mov arrayWords[esi], bx ; Save value
      sub esi, TYPE arrayWords ; Go back to original index

      sub esi, TYPE arrayWords
      Loop Order

   mov esi, 0
   mov arrayWords[esi], ax


   pop ecx
   Loop Start
   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main 