;; function signature from javascript_tags.scm with return_type added.
(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    return_type: ([
      (type_annotation (_) @codeium.return_type)
      (asserts_annotation (_) @codeium.return_type)
      (type_predicate_annotation (_) @codeium.return_type)
    ])?
    body: (_)? @body) @definition.method
  (#not-eq? @name "constructor")
  (#has-type? @definition.method method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @definition.method)
)

;; function signature from javascript_tags.scm with return_type added.
(
  (comment)* @doc
  .
  (_
    name: (identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    return_type: ([
      (type_annotation (_) @codeium.return_type)
      (asserts_annotation (_) @codeium.return_type)
      (type_predicate_annotation (_) @codeium.return_type)
    ])?
    body: (_)? @body) @definition.function
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
      return_type: ([
      (type_annotation (_) @codeium.return_type)
      (asserts_annotation (_) @codeium.return_type)
      (type_predicate_annotation (_) @codeium.return_type)
    ])?
    body: (_)? @body) @_) @definition.function
  (#has-type? @_ function_declaration function_signature generator_function_declaration)
  (#select-adjacent! @doc @definition.function)
  (#set! is_export true)
)

;; function signature from javascript_tags.scm with return_type added.
(
  (comment)* @doc
  .
  (_
    (variable_declarator
      name: (identifier) @name
      value: [
        (arrow_function
          parameters: (formal_parameters) @codeium.parameters
          return_type: ([
            (type_annotation (_) @codeium.return_type)
            (asserts_annotation (_) @codeium.return_type)
            (type_predicate_annotation (_) @codeium.return_type)
          ])?
          body: (_)? @body)
        (function_expression
          parameters: (formal_parameters) @codeium.parameters
          return_type: ([
            (type_annotation (_) @codeium.return_type)
            (asserts_annotation (_) @codeium.return_type)
            (type_predicate_annotation (_) @codeium.return_type)
          ])?
          body: (_)? @body)
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
            return_type: ([
              (type_annotation (_) @codeium.return_type)
              (asserts_annotation (_) @codeium.return_type)
              (type_predicate_annotation (_) @codeium.return_type)
            ])?
            body: (_)? @body)
          (function_expression
            parameters: (formal_parameters) @codeium.parameters
            return_type: ([
              (type_annotation (_) @codeium.return_type)
              (asserts_annotation (_) @codeium.return_type)
              (type_predicate_annotation (_) @codeium.return_type)
            ])?
            body: (_)? @body)
        ])) @_) @definition.function
  (#has-type? @_ lexical_declaration variable_declaration)
  (#select-adjacent! @doc @definition.function)
  (#set! is_export true)
)

;; function signature from javascript_tags.scm with return_type added.
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
          return_type: ([
            (type_annotation (_) @codeium.return_type)
            (asserts_annotation (_) @codeium.return_type)
            (type_predicate_annotation (_) @codeium.return_type)
          ])?
          body: (_)? @body)
        (function_expression
          parameters: (formal_parameters) @codeium.parameters
          return_type: ([
            (type_annotation (_) @codeium.return_type)
            (asserts_annotation (_) @codeium.return_type)
            (type_predicate_annotation (_) @codeium.return_type)
          ])?
          body: (_)? @body)
      ]
    )) @definition.function
  (#select-adjacent! @doc @definition.function)
)

;; function signature from javascript_tags.scm with return_type added.
(
  (comment)* @doc
  .
  (pair
    key: (property_identifier) @name
    value: [
      (arrow_function
        parameters: (formal_parameters) @codeium.parameters
        return_type: ([
          (type_annotation (_) @codeium.return_type)
          (asserts_annotation (_) @codeium.return_type)
          (type_predicate_annotation (_) @codeium.return_type)
        ])?
        body: (_)? @body)
      (function_expression
        parameters: (formal_parameters) @codeium.parameters
        return_type: ([
          (type_annotation (_) @codeium.return_type)
          (asserts_annotation (_) @codeium.return_type)
          (type_predicate_annotation (_) @codeium.return_type)
        ])?
        body: (_)? @body)
    ]) @definition.function
  (#select-adjacent! @doc @definition.function)
)

;; function_signature from tree-sitter-typescript/queries/tags.scm.
;; function_declaration/generator_function_declaration aren't supported.
(
  (comment)* @doc
  .
  (ambient_declaration
    (function_signature
      name: (identifier) @name
      parameters: (formal_parameters) @codeium.parameters
      return_type: ([
        (type_annotation (_) @codeium.return_type)
        (asserts_annotation (_) @codeium.return_type)
        (type_predicate_annotation (_) @codeium.return_type)
      ])?
      body: (_)? @body)) @definition.function
  (#not-has-parent? @definition.function export_statement)
  (#select-adjacent! @doc @definition.function)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (ambient_declaration
      (function_signature
        name: (identifier) @name
        parameters: (formal_parameters) @codeium.parameters
        return_type: ([
          (type_annotation (_) @codeium.return_type)
          (asserts_annotation (_) @codeium.return_type)
          (type_predicate_annotation (_) @codeium.return_type)
        ])?
        body: (_)? @body))) @definition.function
  (#select-adjacent! @doc @definition.function)
  (#set! is_export true)
)

;; method_signature/abstract_method_signature is handled in javascript_tags.scm.

;; abstract_class_declaration from tree-sitter-typescript/queries/tags.scm.
(
  (comment)* @doc
  .
  (ambient_declaration
    (_
      name: (_) @name
      body: (class_body) @body) @_) @definition.class
  (#has-type? @_ class_declaration abstract_class_declaration)
  (#not-has-parent? @definition.class export_statement)
  (#select-adjacent! @doc @definition.class)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (ambient_declaration
      (_
        name: (_) @name
        body: (class_body) @body) @_)) @definition.class
  (#has-type? @_ class_declaration abstract_class_declaration)
  (#select-adjacent! @doc @definition.class)
  (#set! is_export true)
)

;; module from tree-sitter-typescript/queries/tags.scm.
(
  (comment)* @doc
  .
  (module
    name: (_) @name) @definition.module
  (#not-has-parent? @definition.module export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.module)
)
(
  (comment)* @doc
  .
  (ambient_declaration
    (module
      name: (_) @name)) @definition.module
  (#select-adjacent! @doc @definition.module)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (module
      name: (_) @name)) @definition.module
  (#select-adjacent! @doc @definition.module)
  (#set! is_export true)
)

;; interface from tree-sitter-typescript/queries/tags.scm.
(
  (comment)* @doc
  .
  (interface_declaration
    name: (_) @name
    body: (_)? @body
    ) @definition.interface
  (#not-has-parent? @definition.interface export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.interface)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (interface_declaration
    name: (_) @name
    body: (_)? @body)) @definition.interface
  (#select-adjacent! @doc @definition.interface)
  (#set! is_export true)
)
(
  (comment)* @doc
  .
  (ambient_declaration
    (interface_declaration
      name: (_) @name
      body: (_)? @body)) @definition.interface
  (#not-has-parent? @definition.interface export_statement)
  (#select-adjacent! @doc @definition.interface)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (ambient_declaration
      (interface_declaration
        name: (_) @name
        body: (_)? @body))) @definition.interface
  (#select-adjacent! @doc @definition.interface)
  (#set! is_export true)
)

;; type_alias_declaration
(
  (comment)* @doc
  .
  (type_alias_declaration
    name: (_) @name
    value: (_)? @body
    ) @definition.type
  (#not-has-parent? @definition.type export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.type)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (type_alias_declaration
    name: (_) @name
    value: (_)? @body
    )) @definition.type
  (#select-adjacent! @doc @definition.type)
  (#set! is_export true)
)
(
  (comment)* @doc
  .
  (ambient_declaration
    (type_alias_declaration
      name: (_) @name
      value: (_)? @body
      )) @definition.type
  (#not-has-parent? @definition.type export_statement)
  (#select-adjacent! @doc @definition.type)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (ambient_declaration
      (type_alias_declaration
        name: (_) @name))) @definition.type
  (#select-adjacent! @doc @definition.type)
  (#set! is_export true)
)

;; namespace
(
  (comment)* @doc
  .
  (internal_module
    name: (_) @name) @definition.namespace
  (#not-has-parent? @definition.namespace export_statement ambient_declaration)
  (#select-adjacent! @doc @definition.namespace)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (internal_module
    name: (_) @name)) @definition.namespace
  (#select-adjacent! @doc @definition.namespace)
  (#set! is_export true)
)
(
  (comment)* @doc
  .
  (ambient_declaration
    (internal_module
      name: (_) @name)) @definition.namespace
  (#not-has-parent? @definition.namespace export_statement)
  (#select-adjacent! @doc @definition.namespace)
)
(
  (comment)* @doc
  .
  (export_statement
    declaration: (ambient_declaration
      (internal_module
        name: (_) @name))) @definition.namespace
  (#select-adjacent! @doc @definition.namespace)
  (#set! is_export true)
)
