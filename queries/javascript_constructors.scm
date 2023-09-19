(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    body: (_)? @body) @definition.constructor
  (#eq? @name "constructor")
  (#has-type? @definition.constructor method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @definition.constructor)
)
