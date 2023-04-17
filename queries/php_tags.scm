(
    (comment)* @doc
    .
    (function_definition
      name: (name) @name
      parameters: (formal_parameters) @codeium.parameters) @definition.function
    (#select-adjacent! @doc @definition.function)
)

(
    (comment)* @doc
    .
    (method_declaration
      name: (name) @name
      parameters: (formal_parameters) @codeium.parameters
      body: (compound_statement)) @definition.method
    (#select-adjacent! @doc @definition.method)
)

(
    (comment)* @doc
    .
    (class_declaration
      name: (name) @name) @definition.class
    (#select-adjacent! @doc @definition.class)
)

(
    (comment)* @doc
    .
    (interface_declaration
      name: (name) @name) @definition.interface
    (#select-adjacent! @doc @definition.interface)
)
