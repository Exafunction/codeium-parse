;; Functions

(
  [
    (line_comment)
    (multiline_comment)
  ]* @doc
  .
  (function_declaration
    (simple_identifier) @name
    (function_value_parameters) @codeium.parameters
    (function_body)? @body
  ) @definition.function
  (#select-adjacent! @doc @definition.function)
)

;; Constructors

(
  [
    (line_comment)
    (multiline_comment)
  ]* @doc
  .
  (secondary_constructor
    "constructor" @name
    (function_value_parameters) @codeium.parameters
  ) @definition.constructor
  (#select-adjacent! @doc @definition.constructor)
)

;; Classes (Also includes interfaces)

(
  [
    (line_comment)
    (multiline_comment)
  ]* @doc
  .
  (class_declaration
    (type_identifier) @name
    (class_body)? @body
  ) @definition.class
  (#select-adjacent! @doc @definition.class)
)

;; Imports

(
  (import_header
    (identifier) @import.named.source @name
    (import_alias)? @import.named.alias
  )
)
