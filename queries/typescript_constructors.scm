(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    return_type: ([
      (type_annotation (_) @codeium.return_type)
      (asserts (_) @codeium.return_type)
      (type_predicate_annotation (_) @codeium.return_type)
    ])?
    body: (_)? @body) @definition.constructor
  (#eq? @name "constructor")
  (#has-type? @definition.constructor method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @definition.constructor)
)
