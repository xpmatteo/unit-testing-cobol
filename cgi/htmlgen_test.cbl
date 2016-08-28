identification division.
  program-id. htmlgen_test.

data division.

  working-storage section.
    01 htmlOutput pic x(1000).

procedure division.

  call "htmlgen-tostring" using htmlOutput
  if htmlOutput = "<p></p>"
    display "." with no advancing
  else
    display "E"
  end-if

  goback.
