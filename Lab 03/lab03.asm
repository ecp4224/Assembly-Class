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
arrayWords WORD 100,?,?,?,?,100
three DWORD 12345678h ; initialize as you want
  bigEndian BYTE 13h, 57h, 9Bh, 0DFh
littleEndian DWORD ?
  myString BYTE "ABCDE", 0
  
.CODE
  Start:
  main PROC
   mov eax, three
   CALL WriteHex
   CALL Crlf
   mov ax, WORD PTR three
   mov bx, WORD PTR [three+2]
   mov WORD PTR three, bx
   mov WORD PTR [three + 2], ax
   mov eax, three
   CALL WriteHex
   CALL Crlf

   mov eax, DWORD PTR [bigEndian+4]
   mov littleEndian, eax
   mov eax, DWORD PTR [bigEndian + 3]
   mov [littleEndian+1], eax
   mov eax, DWORD PTR [bigEndian + 2]
   mov [littleEndian+2], eax
   mov eax, DWORD PTR [bigEndian + 1]
   mov [littleEndian+3], eax
   mov eax, DWORD PTR bigEndian
   mov [littleEndian+4], eax
   mov eax, littleEndian
   CALL WriteHex
   CALL Crlf

   mov myString, "H"
   mov [myString+1], "E"
   mov [myString+2], "L"
   mov [myString+3], "L"
   mov [myString+4], "O"
   MOV edx, OFFSET myString
   CALL WriteString
   CALL Crlf

   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main 