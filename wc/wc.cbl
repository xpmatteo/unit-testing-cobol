identification division.
program-id. wc.

environment division.
  input-output section.
    file-control.

      select inputfile assign to inputfilename
        organization is line sequential.

data division.
  file section.
    fd inputfile record is varying 0 to 200 depending on inputLineLength.
    01 inputLine pic x(200).

  working-storage section.
    01 byteCount              pic 9(06) value 0.
    01 wordCount              pic 9(06) value 0.
    01 lineCount              pic 9(06) value 0.
    01 inputLineLength        pic 9(06) value 0.
    01 inputLinePointer       pic 9(03).
    01 inputWord              pic X(200).
    
    01 outputRecord.
      02 outputLineCount      pic ZZZZZZZ9.
      02 outputWordCount      pic ZZZZZZZ9.
      02 outputByteCount      pic ZZZZZZZ9.
      02 filler               pic X value space.
      02 inputFileName        pic X(80).
    
    01 inputFileStatus        pic 9 value 0.
      88 endOfInput value 1.

procedure division.

main.
  accept inputFileName from argument-value
  open input inputFile
  perform until endOfInput
    read inputFile
    at end set endOfInput to true
    not at end perform parseLine
  end-perform.
  perform outputOneRecord
  close inputFile
  goback
  .

parseLine.
  add 1 to lineCount
  add inputLineLength to byteCount
  add 1 to byteCount

  move 1 to inputLinePointer
  perform until inputLinePointer > inputLineLength
    unstring inputLine delimited by all spaces 
      into inputWord 
      with pointer inputLinePointer
    end-unstring
    add 1 to wordCount
  end-perform.
  .

outputOneRecord.
  move byteCount to outputByteCount
  move wordCount to outputWordCount
  move lineCount to outputLineCount
  display function trim(outputRecord, trailing)
  .
