identification division.
  program-id. htmlgen.

data division.
  working-storage section.
    01 outputBuffer pic x(1000).

  linkage section.
    01 htmlOutput pic x(1000).
    01 tagName pic x(100).
    

procedure division.

  entry "htmlgen-start-element" using by content tagName
    move spaces to outputBuffer
    string 
      "<" 
        tagName delimited by space 
      "></" 
        tagName delimited by space 
      ">" 
      into outputBuffer
    goback.

  entry "htmlgen-tostring" using htmlOutput
    move outputBuffer to htmlOutput
    goback.



  goback.