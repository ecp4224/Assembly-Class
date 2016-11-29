INCLUDE \masm32\include\masm32rt.inc  ; for using inkey
INCLUDE \masm32\include\debug.inc
INCLUDELIB \masm32\lib\debug.lib

.486
.model flat, stdcall
.STACK 1000h
ExitProcess PROTO, DwErrorCode:DWORD
WriteHex PROTO
Crlf PROTO

.CONST
  SUNDAY = 0
  MONDAY = 1
  TUESDAY = 2
  WEDNESDAY = 3
  THRUSDAY = 4
  FRIDAY = 5
  SATURDAY = 6

.DATA
  week BYTE SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THRUSDAY, FRIDAY, SATURDAY
  
.CODE
  Start:
  main PROC
   DumpMem OFFSET week, 7, "Week Days\n"
   inkey ; then console build should be performed
   INVOKE ExitProcess, 0
  main ENDP
END main 