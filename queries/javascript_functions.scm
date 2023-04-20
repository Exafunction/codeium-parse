;; Tags for parsing Javascript functions. Should not be used with Typescript as it will cause
;; duplicates with typescript_tags.scm.

;; 0. Pattern 0 from tags.scm.
(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    body: (_) @body) @definition.method
  (#not-eq? @name "constructor")
  (#has-type? @definition.method method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @definition.method)
)

;; Pattern 2 from tags.scm.
;; Deleted function and generator_function.
;; https://github.com/tree-sitter/tree-sitter/issues/1811
;;
;; 2.
(
  (comment)* @doc
  .
  (_
    name: (identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    body: (_) @body) @definition.function
  (#has-type? @definition.function function_declaration function_signature generator_function_declaration)
  (#not-has-parent? @definition.function export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.function)
)
(
  (comment)* @doc
  .
  (export_statement
    (_
      name: (identifier) @name
      parameters: (formal_parameters) @codeium.parameters
      body: (_) @body) @_) @definition.function
  (#has-type? @_ function_declaration function_signature generator_function_declaration)
  (#select-adjacent! @doc @definition.function)
  (#set! is_export true)
)

;; Pattern 3 from tags.scm.
;;
;; 4.
(
  (comment)* @doc
  .
  (_
    (variable_declarator
      name: (identifier) @name
      value: [
        (arrow_function
          parameters: (formal_parameters) @codeium.parameters
          body: (_) @body)
        (function
          parameters: (formal_parameters) @codeium.parameters
          body: (_) @body)
      ])) @definition.function
  (#has-type? @definition.function lexical_declaration variable_declaration)
  (#not-has-parent? @definition.function export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.function)
)
(
  (comment)* @doc
  .
  (export_statement
    (_
      (variable_declarator
        name: (identifier) @name
        value: [
          (arrow_function
            parameters: (formal_parameters) @codeium.parameters
            body: (_) @body)
          (function
            parameters: (formal_parameters) @codeium.parameters
            body: (_) @body)
        ])) @_) @definition.function
  (#has-type? @_ lexical_declaration variable_declaration)
  (#select-adjacent! @doc @definition.function)
  (#set! is_export true)
)

;; 6. Pattern 5 from tags.scm.
(
  (comment)* @doc
  .
  (expression_statement
    (assignment_expression
      left: [
        (identifier) @name
        (member_expression
          property: (property_identifier) @name)
      ]
      right: [
        (arrow_function
          parameters: (formal_parameters) @codeium.parameters
          body: (_) @body)
        (function
          parameters: (formal_parameters) @codeium.parameters
          body: (_) @body)
      ]
    )) @definition.function
  (#select-adjacent! @doc @definition.function)
)

;; 7. Pattern 6 from tags.scm.
(
  (comment)* @doc
  .
  (pair
    key: (property_identifier) @name
    value: [
      (arrow_function
        parameters: (formal_parameters) @codeium.parameters
        body: (_) @body)
      (function
        parameters: (formal_parameters) @codeium.parameters
        body: (_) @body)
    ]) @definition.function
  (#select-adjacent! @doc @definition.function)
)
