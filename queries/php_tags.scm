(
    (comment)* @doc
    .
    (function_definition
      name: (name) @name
      parameters: (formal_parameters) @codeium.parameters
      body: (compound_statement)? @body) @definition.function
    (#select-adjacent! @doc @definition.function)
)

(
    (comment)* @doc
    .
    (method_declaration
      name: (name) @name
      parameters: (formal_parameters) @codeium.parameters
      body: (compound_statement)? @body) @definition.method
    (#select-adjacent! @doc @definition.method)
)

(
    (comment)* @doc
    .
    (class_declaration
      name: (name) @name
      body: (declaration_list) @body) @definition.class
    (#select-adjacent! @doc @definition.class)
)

(
    (comment)* @doc
    .
    (interface_declaration
      name: (name) @name
      body: (declaration_list) @body) @definition.interface
    (#select-adjacent! @doc @definition.interface)
)

(program
  (namespace_definition
    name: (namespace_name) @name) @definition.namespace) @codeium.lineage_node
