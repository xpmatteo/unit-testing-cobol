IDENTIFICATION DIVISION.
PROGRAM-ID. StringCalculatorTest.

DATA DIVISION.
  WORKING-STORAGE SECTION.
    01 inputString    PIC X(100).
    01 result         PIC 9(10).
    01 firstAddend    PIC 9(10).
    01 secondAddend   PIC 9(10).
    01 thirdAddend    PIC 9(10).

    01 expectedResult PIC 9(10).

PROCEDURE DIVISION.

  MOVE "1,2,7" TO inputString.
  MOVE 10 TO expectedResult.
  PERFORM "testAdd".

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
*>  PERFORM "testAdd".


  DISPLAY SPACE.
GOBACK.

  doAdd.
  MOVE 0 TO firstAddend secondAddend thirdAddend.
  UNSTRING inputString
    DELIMITED BY ","
    INTO
      firstAddend
      secondAddend
      thirdAddend
  ADD firstAddend secondAddend TO thirdAddend GIVING result.

  testAdd.
  PERFORM "doAdd".
  IF result = expectedResult THEN
    DISPLAY "." WITH NO ADVANCING
  ELSE
    DISPLAY SPACE
    DISPLAY "Expected " expectedResult " but was " result
  END-IF.
