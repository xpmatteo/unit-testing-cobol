identification division.
  program-id. htmlgen_test.

data division.

  working-storage section.
    01 htmlOutput pic x(1000).
    01 expected   pic x(1000).

procedure division.

  move "<p></p>" to expected
  perform htmlgenTest
  goback
  .
  
  htmlgenTest.

    call "htmlgen-tostring" using htmlOutput
    if htmlOutput = expected
      display "." with no advancing
    else
      display "E"
      display "Expected --" function trim(expected) "--"
      display "But was  --" function trim(htmlOutput) "--"
    end-if
    display spaces
    .
