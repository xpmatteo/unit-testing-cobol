identification division.
program-id. wc.

data division.
working-storage section.
  01 outputRecord.
    02 outputByteCount      pic ZZZZZZZ9.
    02 outputWordCount      pic ZZZZZZZ9.
    02 outputLineCount      pic ZZZZZZZ9.
    02 filler               pic X value space.
    02 inputFileName        pic X(80).
  01 input-file-name pic X(80).

procedure division.

main.
  accept inputFileName from argument-value
  move 0 to outputByteCount
  move 0 to outputWordCount
  move 0 to outputLineCount
  display function trim(outputRecord, trailing)

  goback.
