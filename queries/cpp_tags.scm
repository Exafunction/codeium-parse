(
  (comment)* @doc
  .
  (_
    [
      "struct"
      "class"
    ]
    .
    name: (_) @name
    body: (field_declaration_list) @body
  ) @definition.class
  (#select-adjacent! @doc @definition.class)
  (#lineage-from-name! "::")
)

(
  (comment)* @doc
  .
  (_
    declarator: (function_declarator
      declarator: (_) @name
      parameters: (parameter_list) @codeium.parameters)
    body: (_)? @body) @definition.function
  (#has-type? @definition.function function_definition declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
)

(namespace_definition
  name: (_) @name
  (#lineage-from-name! "::")
) @definition.namespace
