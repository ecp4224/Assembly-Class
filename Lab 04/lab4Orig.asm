INCLUDE \masm32\include\masm32rt.inc
INCLUDE \masm32\include\Irvine32.inc
INCLUDELIB \masm32\lib\Irvine32.lib
INCLUDE \masm32\include\debug.inc
INCLUDELIB \masm32\lib\debug.lib

.data
 barray BYTE 6 DUP (?)
 dwarray DWORD 3 DUP (?)
 TOTAL_LENGTH = $-barray
 bdmessage BYTE "Today as stored in a double word", 0dh, 0ah, 0
 dwmessage BYTE 0dh, 0ah, "Seeing bytes in a single word", 0dh, 0ah, 0
 lengthmessage BYTE 0dh, 0ah, "total bytes used: ", 0
 finalmessage BYTE 0dh, 0ah, "Press any key to continue ...", 0

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
    MOV edx, OFFSET finalmessage
    CALL WriteString
    
    CALL ReadChar
    INVOKE ExitProcess, 0
    
  main ENDP
  END main  

