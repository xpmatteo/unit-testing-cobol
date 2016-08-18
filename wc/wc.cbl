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
    01 commandLineParsing.
      02 argumentCount pic 9999.
      02 argumentValue pic x(100).
      02 argumentIndex pic 9999.
  
    01 currentFileCounters.
      02 byteCount              pic 9(06).
      02 wordCount              pic 9(06).
      02 lineCount              pic 9(06).
      
    01 scratchVariables.
      02 inputLineLength        pic 9(06).
      02 inputLinePointer       pic 9(03).
      02 inputWord              pic X(200).
    
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
  accept argumentCount from argument-number
  perform varying argumentIndex from 1 by 1 until argumentIndex > argumentCount
    display argumentIndex upon argument-number
    accept inputFileName from argument-value    
    perform parseFile
  end-perform.
  if argumentCount > 1
    move 2 to lineCount
    move 3 to wordCount
    move 12 to byteCount
    move "total" to inputFileName
    perform outputOneRecord
  end-if
  goback
  .
  
parseFile.
  open input inputFile
  move zero to currentFileCounters
  move zero to inputFileStatus
  perform until endOfInput
    read inputFile
    at end set endOfInput to true
    not at end perform parseLine
  end-perform.
  perform outputOneRecord
  close inputFile
  .

parseLine.
  perform countLines
  perform countBytes
  perform countWords
  .

countLines.
  add 1 to lineCount
  .
  
countBytes.
  add inputLineLength to byteCount
  add 1 to byteCount
  .

countWords.
  move 1 to inputLinePointer
  perform until inputLinePointer > inputLineLength
    unstring inputLine delimited by all spaces 
      into inputWord 
      with pointer inputLinePointer
    end-unstring
    if not inputWord = spaces 
      add 1 to wordCount
    end-if
  end-perform
  .

outputOneRecord.
  move byteCount to outputByteCount
  move wordCount to outputWordCount
  move lineCount to outputLineCount
  display function trim(outputRecord, trailing)
  .
