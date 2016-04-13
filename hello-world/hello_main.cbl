IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.

DATA DIVISION.
   WORKING-STORAGE SECTION.
   01 RETURNED-MESSAGE PIC A(30).
   01 USER-NAME PIC A(15).

PROCEDURE DIVISION.
   ACCEPT USER-NAME FROM ARGUMENT-VALUE.
   CALL 'HELLO-MESSAGE' USING RETURNED-MESSAGE, BY CONTENT USER-NAME.
   DISPLAY FUNCTION TRIM(RETURNED-MESSAGE).
