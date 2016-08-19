IDENTIFICATION DIVISION.
PROGRAM-ID. StringCalculatorTest.

DATA DIVISION.
  WORKING-STORAGE SECTION.
*> constants
    01 newline         PIC X   VALUE x'0a'.

*> add routine parameters
    01 inputString    PIC X(100).
    01 result         PIC 9(10).

*> add routine working storage
    01 addend         PIC 9(10).
    01 stringPointer           PIC 9(10).
    01 digit          PIC 9.

*> test working storage
    01 expectedResult PIC 9(10).

PROCEDURE DIVISION.

TestSuite.
  MOVE SPACE TO inputString.
  MOVE 0 TO expectedResult.
  PERFORM "testAdd".

  MOVE "123" TO inputString.
  MOVE 123 TO expectedResult.
  PERFORM "testAdd".

  MOVE "1,3" TO inputString.
  MOVE 4 TO expectedResult.
  PERFORM "testAdd".

  MOVE "1,2,7,33,44" TO inputString.
  MOVE 87 TO expectedResult.
  PERFORM "testAdd".

  MOVE SPACES TO inputString.
  STRING "1" newline "2,3" INTO inputString.
  MOVE 6 TO expectedResult.
  PERFORM "testAdd".

  MOVE SPACES TO inputString.
  STRING "//;" newline "1;2" INTO inputString.
  MOVE 3 TO expectedResult.
  PERFORM "testAdd".

  MOVE SPACES TO inputString.
  STRING "//[ab]" newline "7ab1ab2" INTO inputString.
  MOVE 10 TO expectedResult.
  PERFORM "testAdd".


  DISPLAY SPACE.
  GOBACK.

doAdd.
  MOVE 0 TO result
  MOVE 0 to addend
  PERFORM VARYING stringPointer FROM 1 BY 1 UNTIL stringPointer > LENGTH OF inputString
    IF inputString(stringPointer:1) IS NUMERIC
      MOVE inputString(stringPointer:1) TO digit
      MULTIPLY addend BY 10 GIVING addend
      ADD digit TO addend
    ELSE
      ADD addend TO result
      MOVE 0 to addend
    END-IF
  END-PERFORM.

testAdd.
  PERFORM "doAdd".
  IF result = expectedResult THEN
    DISPLAY "." WITH NO ADVANCING
  ELSE
    DISPLAY SPACE
    DISPLAY "Expected " expectedResult " but was " result
  END-IF.
