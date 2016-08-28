identification division.
  program-id. htmlgen_test.

data division.

  working-storage section.
    01 htmlOutput   pic x(1000).
    01 expected     pic x(1000).
    01 tagName      pic x(100).
    01 textContent  pic x(100).

procedure division.


empty-p.
  call "htmlgen-initialize" 
  move spaces to tagName.
  move "p" to tagName.
  call "htmlgen-start-element" using by content tagName
  call "htmlgen-end-element" 
  move "<p></p>" to expected
  perform htmlgenTest
  .

empty-div.
  call "htmlgen-initialize" 
  move spaces to tagName
  move "div" to tagName
  call "htmlgen-start-element" using by content tagName
  call "htmlgen-end-element"
  move "<div></div>" to expected
  perform htmlgenTest
  .
  
paragraph-with-text.
  call "htmlgen-initialize" 
  move spaces to tagName
  move "p" to tagName
  call "htmlgen-start-element" using by content tagName
  
  move spaces to textContent. 
  move "ciao" to textContent.
  call "htmlgen-add-text-content" using by content textContent
  call "htmlgen-end-element"
  
  move "<p>ciao</p>" to expected
  perform htmlgenTest
  .
  
*>nested-elements.
*>  call "htmlgen-initialize" 
*>  move spaces to tagName
*>  move "div" to tagName
*>  call "htmlgen-start-element" using by content tagName
*>
*>  move spaces to tagName
*>  move "p" to tagName
*>  call "htmlgen-start-element" using by content tagName
*>  
*>  call "htmlgen-end-element"
*>  call "htmlgen-end-element"
*>  
*>  move "<div><p></p></div>" to expected
*>  perform htmlgenTest
*>  .
*>  
end-test-suite.  
  display spaces
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
  .
