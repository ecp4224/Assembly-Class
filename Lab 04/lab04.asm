INCLUDE \masm32\include\masm32rt.inc
INCLUDE \masm32\include\Irvine32.inc
INCLUDE \masm32\include\debug.inc
INCLUDELIB \masm32\lib\Irvine32.lib
INCLUDELIB \masm32\lib\debug.lib

.data
 barray BYTE 0, 0, 0A0h, 3Ah, 99h, 00
 dwarray DWORD ?, 0D9030000h, ?, ?
 TOTAL_LENGTH = $-barray
 array WORD 11h, 22h, 33h, 44h, 55h, 66h, 77h
 LEN = LENGTHOF array / 2

 bdmessage BYTE "Today as stored in a double word", 0dh, 0ah, 0
 dwmessage BYTE 0dh, 0ah, "Seeing bytes in a single word", 0dh, 0ah, 0
 lengthmessage BYTE 0dh, 0ah, "total bytes used: ", 0
 finalmessage BYTE 0dh, 0ah, "Press any key to continue ...", 0
 counter DWORD 0

.code 
  main PROC
    CALL Crlf
    MOV edx, OFFSET bdmessage
    CALL WriteString
    MOV eax, DWORD PTR [barray + 2]
    CALL WriteDec
    MOV edx, OFFSET dwmessage
    CALL WriteString
    MOVZX eax, WORD PTR [dwarray + 6]
    CALL WriteDec
    MOV edx, OFFSET lengthmessage
    CALL WriteString
    MOV eax, TOTAL_LENGTH
    CALL WriteDec

    mov ecx, LEN
    
    mov ebx, SIZEOF array
    mov esi, 0
    mov edi, ebx;
    sub edi, TYPE array
    
    Reverse:
      mov ax, array[esi]
      mov bx, array[edi]
      mov array[edi], ax
      mov array[esi], bx
      add esi, TYPE array
      sub edi, TYPE array
      Loop Reverse
      
    DumpMem OFFSET array, SIZEOF array, "Output"

    MOV edx, OFFSET finalmessage
    CALL WriteString
    CALL ReadChar
    INVOKE ExitProcess, 0
    
  main ENDP
  END main  


