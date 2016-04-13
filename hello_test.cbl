IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO-TEST.

DATA DIVISION.
   WORKING-STORAGE SECTION.
   01 userName PIC A(15).
   01 returnedMessage PIC A(30).
   01 expectedMessage PIC A(30).
   01 errorsCount PIC 999 VALUE 0.



PROCEDURE DIVISION.

*> if a name is passed
    MOVE 'Jonathan' TO userName.
    MOVE 'Hello, Jonathan!' TO expectedMessage.
    PERFORM 'CHECK-HELLO-MESSAGE'

*> if no name is passed
    MOVE SPACES TO userName.
    MOVE 'Hello, world!' TO expectedMessage.
    PERFORM 'CHECK-HELLO-MESSAGE'

*> Upcase the first letter of the name
    MOVE 'foo' TO userName
    MOVE 'Hello, Foo!' to expectedMessage
    PERFORM 'CHECK-HELLO-MESSAGE'

*> noise in the return string is cleaned
    MOVE SPACES TO returnedMessage.
    INSPECT returnedMessage REPLACING ALL " " BY "x".
    MOVE SPACES TO userName.
    MOVE 'Hello, world!' TO expectedMessage.
    PERFORM 'CHECK-HELLO-MESSAGE'

    IF errorsCount > 0 THEN
      STOP RUN RETURNING 1
    END-IF.
  GOBACK.

  CHECK-HELLO-MESSAGE.
    CALL 'HELLO-MESSAGE' USING returnedMessage, userName.
    IF expectedMessage = returnedMessage THEN
      DISPLAY "." WITH NO ADVANCING
    ELSE
      ADD 1 TO errorsCount
      DISPLAY SPACES
      DISPLAY "Mismatch: >" expectedMessage "<"
      DISPLAY "  actual: >" returnedMessage "<"
    END-IF.

