identification division.
  program-id. htmlgen.

data division.
  linkage section.
    01 htmlOutput pic x(1000).

procedure division.

  entry "htmlgen-tostring" using htmlOutput
  move "<p></p>" to htmlOutput
  .

  goback.