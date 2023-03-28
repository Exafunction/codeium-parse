;; 0. Pattern 0 from tags.scm.
(
  (class_definition
    name: (identifier) @name
    body: (block . (expression_statement . (string) @doc .)?)) @definition.class
  (#not-has-parent? @definition.class decorated_definition)
)

;; 1. Pattern 1 from tags.scm.
(
  (function_definition
    name: (identifier) @name
    parameters: (parameters) @codeium.parameters
    body: (block . (expression_statement . (string) @doc .)?) @body) @definition.function
  (#not-has-parent? @definition.function decorated_definition)
)

;; 2. Pattern 2 from tags.scm.
;; Note that we can't distinguish from @reference.class.
(call
  function: [
      (identifier) @name
      (attribute
        attribute: (identifier) @name)
  ]) @reference.call

(
  (decorated_definition
    definition: (class_definition
      name: (identifier) @name
      body: (block . (expression_statement . (string) @doc .)?))) @definition.class
)

(
  (decorated_definition
    definition: (function_definition
      name: (identifier) @name
      parameters: (parameters) @codeium.parameters
      body: (block . (expression_statement . (string) @doc .)?) @body)) @definition.function
)
