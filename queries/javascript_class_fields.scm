(
    (class_body
        ([
            (field_definition)
        ]) @field
    )
)

(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    body: (_)? @body) @codeium.constructor
  (#eq? @name "constructor")
  (#has-type? @codeium.constructor method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @codeium.constructor)
)
