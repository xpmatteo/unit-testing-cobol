identification division.
  program-id. htmlgen.

data division.
  working-storage section.
    01 outputBuffer pic x(1000).
    01 outputBufferPointer pic 9(4).
    01 indentLevel pic 9(4).
    01 openTagNamesTable.
      02 openTagNames pic x(100) occurs 100 times.

  linkage section.
    01 outputBufferArgument pic x(1000).
    01 tagNameArgument pic x(100).
    01 textContentArgument pic x(100).


procedure division.

  entry "htmlgen-initialize"
    move 0 to indentLevel
    move 1 to outputBufferPointer
    move spaces to outputBuffer
    goback.

  entry "htmlgen-start-element" using by content tagNameArgument
    add 1 to indentLevel
    move tagNameArgument to openTagNames(indentLevel)
    string 
      "<" 
        openTagNames(indentLevel) delimited by space 
      ">" 
      into outputBuffer
      with pointer outputBufferPointer
    goback.

  entry "htmlgen-tostring" using outputBufferArgument
    move outputBuffer to outputBufferArgument
    goback.

  entry "htmlgen-end-element"
    string
      "</" 
      openTagNames(indentLevel) delimited by space 
      ">"
      into outputBuffer
      with pointer outputBufferPointer
    subtract 1 from indentLevel
    goback.

  entry "htmlgen-add-text-content" using by content textContentArgument
    string
      textContentArgument delimited by space
      into outputBuffer
      with pointer outputBufferPointer
    goback.


  goback.