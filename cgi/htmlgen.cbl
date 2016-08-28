identification division.
  program-id. htmlgen.

data division.
  working-storage section.
    01 outputBuffer pic x(1000).
    01 tagName pic x(100).
    01 outputBufferPointer pic 9(4).

  linkage section.
    01 htmlOutput pic x(1000).
    01 tagNameArgument pic x(100).
    

procedure division.

  entry "htmlgen-start-element" using by content tagNameArgument
    move 1 to outputBufferPointer
    move tagNameArgument to tagName
    move spaces to outputBuffer
    string 
      "<" 
        tagName delimited by space 
      ">" 
      into outputBuffer
      with pointer outputBufferPointer
    goback.

  entry "htmlgen-tostring" using htmlOutput
    move outputBuffer to htmlOutput
    goback.

  entry "htmlgen-end-element"
    string
      "</" 
      tagName delimited by space 
      ">"
      into outputBuffer
      with pointer outputBufferPointer
    goback.

  entry "htmlgen-add-text-content"
    goback.


  goback.