IDENTIFICATION DIVISION.
PROGRAM-ID. StringCalculatorTest.

DATA DIVISION.
  WORKING-STORAGE SECTION.
*> add parameters
    01 inputString    PIC X(100).
    01 result         PIC 9(10).

*> add working storage
    01 stringPointer  PIC 9(10).
    01 addend    PIC 9(10).

*> test working storage
    01 expectedResult PIC 9(10).

PROCEDURE DIVISION.

TestSuite.
  MOVE SPACE TO inputString.
  MOVE 0 TO expectedResult.
  PERFORM "testAdd".

  MOVE "1" TO inputString.
  MOVE 1 TO expectedResult.
  PERFORM "testAdd".

  MOVE "1,3" TO inputString.
  MOVE 4 TO expectedResult.
  PERFORM "testAdd".

  MOVE "1,2,7,33,44" TO inputString.
  MOVE 87 TO expectedResult.
  PERFORM "testAdd".

  MOVE "1\n2,3" TO inputString.
  MOVE 6 TO expectedResult.
  PERFORM "testAdd".

  MOVE "//;\n1;2" TO inputString.
  MOVE 3 TO expectedResult.
*>  PERFORM "testAdd".


  DISPLAY SPACE.
  GOBACK.

doAdd.
  MOVE 0 TO result.
  MOVE 1 TO stringPointer.
  PERFORM UNTIL stringPointer > LENGTH OF inputString
    UNSTRING inputString
      DELIMITED BY "," OR "\n"
      INTO addend
      WITH POINTER stringPointer
    ADD addend TO result
  END-PERFORM.

testAdd.
  PERFORM "doAdd".
  IF result = expectedResult THEN
    DISPLAY "." WITH NO ADVANCING
  ELSE
    DISPLAY SPACE
    DISPLAY "Expected " expectedResult " but was " result
  END-IF.
