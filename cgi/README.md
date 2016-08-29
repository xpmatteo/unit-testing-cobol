
Utilities for writing cgi programs in Cobol

Bugs:

 - cannot add text content with more than one word
 - does not check start element and end element calls are balanced
 - does not protect against XSS in text content
 - does not protect against XSS in attribute names and values
 - cannot add attribute values containing spaces
 