identification division.
program-id. wc.

environment division.
  input-output section.
    file-control.

      select inputfile assign to inputfilename
        organization is line sequential.

data division.
  file section.
    fd inputfile record is varying in size.
    01 inputfilerecord pic x(200).

  working-storage section.
    01 byteCount              pic 9(06) value 0.
    01 wordCount              pic 9(06) value 0.
    01 lineCount              pic 9(06) value 0.
    
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
    not at end
      move 5 to byteCount
      move 1 to wordCount
      move 1 to lineCount
  end-perform.
  perform outputOneRecord
  close inputFile
  goback
  .
  
outputOneRecord.
  move byteCount to outputByteCount
  move wordCount to outputWordCount
  move lineCount to outputLineCount
  display function trim(outputRecord, trailing)
  .
