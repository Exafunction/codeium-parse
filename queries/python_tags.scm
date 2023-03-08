;; 0. Pattern 0 from tags.scm.
(class_definition
  name: (identifier) @name
  body: (block . (expression_statement . (string) @doc .)?)) @definition.class

;; 1. Pattern 1 from tags.scm.
(function_definition
  name: (identifier) @name
  parameters: (parameters) @codeium.parameters
  body: (block . (expression_statement . (string) @doc .)?)) @definition.function

;; 2. Pattern 2 from tags.scm.
;; Note that we can't distinguish from @reference.class.
(call
  function: [
      (identifier) @name
      (attribute
        attribute: (identifier) @name)
  ]) @reference.call
