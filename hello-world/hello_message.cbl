IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO-MESSAGE.

DATA DIVISION.
   LINKAGE SECTION.
   01 returnedMessage PIC X(30).
   01 userName.
      02 firstLetterOfName PIC X(1).
      02 FILLER PIC X(14).

PROCEDURE DIVISION USING returnedMessage, userName.
  MOVE SPACES TO returnedMessage.
  MOVE FUNCTION UPPER-CASE(firstLetterOfName) TO firstLetterOfName.
  IF userName = SPACES THEN
    MOVE 'world' to userName.
  STRING
    'Hello, ' DELIMITED BY SIZE
    userName DELIMITED BY SPACES
    '!'
  INTO returnedMessage.
  GOBACK.
