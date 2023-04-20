;; 1. Pattern 1 from tags.scm.
;; Deleted class.
(
  (comment)* @doc
  .
  (_
    name: (_) @name
    body: (class_body) @body) @definition.class
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
      body: (class_body) @body) @_) @definition.class
  (#has-type? @_ class_declaration abstract_class_declaration)
  (#select-adjacent! @doc @definition.class)
  (#set! is_export true)
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
      value: (class
        body: (_) @body))) @definition.class
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
        value: (class
          body: (_) @body))) @_) @definition.class
  (#has-type? @_ lexical_declaration variable_declaration)
  (#select-adjacent! @doc @definition.class)
  (#set! is_export true)
)
