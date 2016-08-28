identification division.
  program-id. htmlgen_test.

data division.

  working-storage section.
    01 htmlOutput pic x(1000).
    01 expected   pic x(1000).
    01 tagName    pic x(100).

procedure division.

  move spaces to tagName.
  move "p" to tagName.
  call "htmlgen-start-element" using by content tagName.
  move "<p></p>" to expected
  perform htmlgenTest

  move spaces to tagName.
  move "div" to tagName.
  call "htmlgen-start-element" using by content tagName.
  move "<div></div>" to expected
  perform htmlgenTest
  
  display spaces
  goback
  .
  
  htmlgenTest.

    call "htmlgen-tostring" using htmlOutput
    if htmlOutput = expected
      display "." with no advancing
    else
      display "E"
      display "Expected --" expected "--"
      display "But was  --" htmlOutput "--"
    end-if
    .
