(
  (function_definition
    name: (identifier) @name
    parameters: (parameters) @codeium.parameters
    body: (block . (expression_statement . (string) @doc .)?) @body) @definition.constructor
  (#not-has-parent? @definition.constructor decorated_definition)
  (#eq? @name "__init__")
)

(
  (decorated_definition
    definition: (function_definition
      name: (identifier) @name
      parameters: (parameters) @codeium.parameters
      body: (block . (expression_statement . (string) @doc .)?) @body)) @definition.constructor
  (#eq? @name "__init__")
)
