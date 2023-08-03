(
  (comment)* @doc
  .
  (_
    name: (_) @name
    body: (field_declaration_list) @body
  ) @definition.class
  (#has-type? @definition.class class_specifier struct_specifier)
  (#not-has-parent? @definition.class template_declaration)
  (#select-adjacent! @doc @definition.class)
  (#lineage-from-name! "::")
)

(
  (comment)* @doc
  .
  (_
    (_type_specifier) @codeium.return_type
    declarator: [
      (function_declarator
        declarator: (_) @name
        parameters: (parameter_list) @codeium.parameters)
      (pointer_declarator
        "*" @codeium.return_type
        (function_declarator
          declarator: (_) @name
          parameters: (parameter_list) @codeium.parameters))
      (pointer_declarator
        "*" @codeium.return_type
        (pointer_declarator
          "*" @codeium.return_type
          (function_declarator
            declarator: (_) @name
            parameters: (parameter_list) @codeium.parameters)))
    ]
    body: (_)? @body) @definition.function
  (#has-type? @definition.function function_definition declaration)
  (#not-has-parent? @definition.function template_declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
)

(namespace_definition
  name: (_) @name
  (#lineage-from-name! "::")
) @definition.namespace

;; Copy to deal with single templates
(
  (comment)* @doc
  .
  (template_declaration
    (_
      name: (_) @name
      body: (field_declaration_list) @body) @_) @definition.class
  (#has-type? @_ class_specifier struct_specifier)
  (#not-has-parent? @definition.class template_declaration)
  (#select-adjacent! @doc @definition.class)
  (#lineage-from-name! "::")
)

(
  (comment)* @doc
  .
  (template_declaration
    (_
      (_type_specifier) @codeium.return_type
      declarator: [
        (function_declarator
          declarator: (_) @name
          parameters: (parameter_list) @codeium.parameters)
        (pointer_declarator
          "*" @codeium.return_type
          (function_declarator
            declarator: (_) @name
            parameters: (parameter_list) @codeium.parameters))
        (pointer_declarator
          "*" @codeium.return_type
          (pointer_declarator
            "*" @codeium.return_type
            (function_declarator
              declarator: (_) @name
              parameters: (parameter_list) @codeium.parameters)))
      ]
      body: (_)? @body) @_) @definition.function
  (#has-type? @_ function_definition declaration)
  (#not-has-parent? @definition.function template_declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
)

;; Copy to deal with double templates
(
  (comment)* @doc
  .
  (template_declaration
    (template_declaration
      (_
        name: (_) @name
        body: (field_declaration_list) @body) @_)) @definition.class
  (#has-type? @_ class_specifier struct_specifier)
  ;; (#not-has-parent? @definition.class template_declaration)
  (#select-adjacent! @doc @definition.class)
  (#lineage-from-name! "::")
)

(
  (comment)* @doc
  .
  (template_declaration
    (template_declaration
      (_
        (_type_specifier) @codeium.return_type
        declarator: [
          (function_declarator
            declarator: (_) @name
            parameters: (parameter_list) @codeium.parameters)
          (pointer_declarator
            "*" @codeium.return_type
            (function_declarator
              declarator: (_) @name
              parameters: (parameter_list) @codeium.parameters))
          (pointer_declarator
            "*" @codeium.return_type
            (pointer_declarator
              "*" @codeium.return_type
              (function_declarator
                declarator: (_) @name
                parameters: (parameter_list) @codeium.parameters)))
        ]
        body: (_)? @body) @_)) @definition.function
  (#has-type? @_ function_definition declaration)
  ;; (#not-has-parent? @definition.function template_declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
)
