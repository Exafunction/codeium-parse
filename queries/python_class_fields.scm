(class_definition
    body: (block (expression_statement
        (assignment) @field
    ))
)
(
    (function_definition
        name: (identifier) @name
        parameters: (parameters) @codeium.parameters
        body: (block . (expression_statement . (string) @doc .)?) @body) @codeium.constructor
    (#eq? @name "__init__")
)
