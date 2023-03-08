;; 0. Pattern 0 from tags.scm.
(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters) @definition.method
  (#not-eq? @name "constructor")
  (#has-type? @definition.method method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @definition.method)
)

;; 1. Pattern 1 from tags.scm.
;; Deleted class.
(
  (comment)* @doc
  .
  (_
    name: (_) @name
    body: (class_body)) @definition.class
  (#has-type? @definition.class class_declaration abstract_class_declaration)
  (#not-has-parent? @definition.class export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.class)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (_
      name: (_) @name
      body: (class_body)) @_) @definition.class
  (#has-type? @_ class_declaration abstract_class_declaration)
  (#select-adjacent! @doc @definition.class)
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
    parameters: (formal_parameters) @codeium.parameters) @definition.function
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
      parameters: (formal_parameters) @codeium.parameters) @_) @definition.function
  (#has-type? @_ function_declaration function_signature generator_function_declaration)
  (#select-adjacent! @doc @definition.function)
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
          parameters: (formal_parameters) @codeium.parameters)
        (function
          parameters: (formal_parameters) @codeium.parameters)
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
            parameters: (formal_parameters) @codeium.parameters)
          (function
            parameters: (formal_parameters) @codeium.parameters)
        ])) @_) @definition.function
  (#has-type? @_ lexical_declaration variable_declaration)
  (#select-adjacent! @doc @definition.function)
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
          parameters: (formal_parameters) @codeium.parameters)
        (function
          parameters: (formal_parameters) @codeium.parameters)
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
        parameters: (formal_parameters) @codeium.parameters)
      (function
        parameters: (formal_parameters) @codeium.parameters)
    ]) @definition.function
  (#select-adjacent! @doc @definition.function)
)

;; 8. Pattern 7 from tags.scm.
(
  (call_expression
    function: (identifier) @name) @reference.call
  (#not-match? @name "^(require)$")
)

;; 9. Pattern 8 from tags.scm.
(
  (call_expression
    function: (member_expression
      property: (property_identifier) @name)
    arguments: (_)) @reference.call
)

;; 10. Pattern 9 from tags.scm.
(new_expression
  constructor: (_) @name) @reference.class

;; 11. let Foo = class {};
(
  (comment)* @doc
  .
  (_
    (variable_declarator
      name: (identifier) @name
      value: (class))) @definition.class
  (#has-type? @definition.class lexical_declaration variable_declaration)
  (#not-has-parent? @definition.class export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.class)
)
(
  (comment)* @doc
  .
  (export_statement
    (_
      (variable_declarator
        name: (identifier) @name
        value: (class))) @_) @definition.class
  (#has-type? @_ lexical_declaration variable_declaration)
  (#select-adjacent! @doc @definition.class)
)
