(script_element
  (start_tag) @_
  (raw_text) @injection.content
  (#match? @_ " lang=\"ts\"")
  (#set! injection.language typescript)
)

(script_element
  (start_tag) @_
  (raw_text) @injection.content
  (#not-match? @_ " lang=")
  (#set! injection.language javascript)
)
