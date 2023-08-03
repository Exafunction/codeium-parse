;; 0. Pattern 0 from tags.scm.
(
  (class_definition
    name: (identifier) @name
    body: (block . (expression_statement . (string) @doc .)?) @body) @definition.class
  (#not-has-parent? @definition.class decorated_definition)
)

;; 1. Pattern 1 from tags.scm.
(
  (function_definition
    name: (identifier) @name
    parameters: (parameters) @codeium.parameters
    body: (block . (expression_statement . (string) @doc .)?) @body) @definition.function
  (#not-has-parent? @definition.function decorated_definition)
  (#not-eq? @name "__init__")
)

;; 2. Pattern 2 from tags.scm.
;; Note that we can't distinguish from @reference.class.
(call
  function: [
      (identifier) @name
      (attribute
        object: (identifier) @parent
        attribute: (identifier) @name)
  ]
  arguments: (argument_list) @codeium.parameters) @reference.call

(
  (decorated_definition
    definition: (class_definition
      name: (identifier) @name
      body: (block . (expression_statement . (string) @doc .)?) @body)) @definition.class
)

(
  (decorated_definition
    definition: (function_definition
      name: (identifier) @name
      parameters: (parameters) @codeium.parameters
      body: (block . (expression_statement . (string) @doc .)?) @body)) @definition.function
)
