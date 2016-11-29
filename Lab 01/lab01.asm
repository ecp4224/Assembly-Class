INCLUDE \masm32\include\masm32rt.inc  ; for using inkey
INCLUDE \masm32\include\Irvine32.inc
INCLUDELIB \masm32\lib\Irvine32.lib
.486
;.model flat, stdcall
.STACK 1000h
ExitProcess PROTO, DwErrorCode:DWORD
WriteHex PROTO
Crlf PROTO

.DATA
  temp DWORD ?
  
.CODE
  Start:
  main PROC
   print "Type a number to convert to hex: "
   call ReadInt
   mov temp, eax ; remember the number just entered
   printf("The number %i in hex is: ", eax)
   mov eax, temp ; move the number entered back into eax
   CALL WriteHex
   CALL Crlf
   print "Now Exiting!", 0dh, 0ah
   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main