INCLUDE \masm32\include\masm32rt.inc  ; for using inkey
INCLUDE \masm32\include\debug.inc
INCLUDELIB \masm32\lib\debug.lib
.486
;.model flat, stdcall
.STACK 1000h
ExitProcess PROTO, DwErrorCode:DWORD
WriteHex PROTO
Crlf PROTO

.DATA
  var1 BYTE 1
  var2 SBYTE "a"
  var3 WORD 4, 5, 6, 9, 8
  var4 SWORD "w"
  var5 DWORD 11
  var6 SDWORD "abcd"
  var7 FWORD 2000
  var8 QWORD 10000, 90000
  
.CODE
  Start:
  main PROC
   DumpMem OFFSET var1, 1, "var1"
   DumpMem OFFSET var2, 1, "var2"
   DumpMem OFFSET var3, 10, "var3"
   DumpMem OFFSET var4, 2, "var4"
   DumpMem OFFSET var5, 4, "var5"
   DumpMem OFFSET var6, 4, "var6"
   DumpMem OFFSET var7, 6, "var7"
   DumpMem OFFSET var8, 16, "var8"
   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main 