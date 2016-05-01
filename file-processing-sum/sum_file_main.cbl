IDENTIFICATION DIVISION.
PROGRAM-ID. SUM-FILE.

ENVIRONMENT DIVISION.
  INPUT-OUTPUT SECTION.
    FILE-CONTROL.
      SELECT InputFile ASSIGN TO inputFileName.
      SELECT SumFile ASSIGN TO outputFileName.

DATA DIVISION.
  FILE SECTION.

    FD InputFile.
    01 InputFileRecord.
      88 endOfInputFile VALUE HIGH-VALUES.
      02 inputNumber   PIC 9999.
      02 FILLER        PIC X VALUE x'0a'.

    FD SumFile.
    01 SumFileRecord.
      02 currentNumber PIC 9999.
      02 separator     PIC X VALUE ' '.
      02 runningSum    PIC 9999.
      02 endOfLine     PIC X VALUE x'0a'.

  WORKING-STORAGE SECTION.
    01 inputFileName PIC X(100).
    01 outputFileName PIC X(100).


PROCEDURE DIVISION.

Main.
  ACCEPT inputFileName FROM ARGUMENT-VALUE.
  ACCEPT outputFileName FROM ARGUMENT-VALUE.
  MOVE ' ' TO separator
  MOVE x'0a' TO endOfLine
  MOVE 0 to runningSum

  OPEN INPUT InputFile.
  OPEN OUTPUT SumFile.

  PERFORM UNTIL endOfInputFile
    READ InputFile
      AT END SET endOfInputFile TO TRUE
      NOT AT END
        MOVE inputNumber TO currentNumber
        ADD inputNumber TO runningSum
        WRITE SumFileRecord
    END-READ
  END-PERFORM.

  CLOSE InputFile.
  CLOSE SumFile.
  GOBACK.
