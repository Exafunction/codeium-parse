(script_element
  (start_tag) @_
  (raw_text) @injection.content
  (#not-match? @_ " src=")
  (#match? @_ " type=\"text/javascript\"")
  (#set! injection.language javascript)
)

(script_element
  (start_tag) @_
  (raw_text) @injection.content
  (#not-match? @_ " src=")
  (#not-match? @_ " type=")
  (#set! injection.language javascript)
)
