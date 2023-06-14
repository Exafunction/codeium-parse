(
  (comment)* @doc
  .
  (class_specifier
    name: (_) @name
    body: (field_declaration_list) @body
  ) @definition.class
  (#select-adjacent! @doc @definition.class)
  (#lineage-from-name! "::")
)
(
  (comment)* @doc
  .
  (struct_specifier
    name: (_) @name
    body: (field_declaration_list) @body
  ) @definition.class
  (#select-adjacent! @doc @definition.class)
  (#lineage-from-name! "::")
)

(
  (comment)* @doc
  .
  (_
    (_type_specifier) @codeium.return_type
    declarator: (function_declarator
      declarator: (_) @name
      parameters: (parameter_list) @codeium.parameters)
    body: (_)? @body) @definition.function
  (#has-type? @definition.function function_definition declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
)

(
  (comment)* @doc
  .
  (_
    (_type_specifier) @codeium.return_type
    declarator: (pointer_declarator
      (function_declarator
        declarator: (_) @name
        parameters: (parameter_list) @codeium.parameters))
    body: (_)? @body) @definition.function
  (#has-type? @definition.function function_definition declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
  (#set! return_type_suffix "*")
)

(
  (comment)* @doc
  .
  (_
    (_type_specifier) @codeium.return_type
    declarator: (pointer_declarator
      (pointer_declarator
        (function_declarator
          declarator: (_) @name
          parameters: (parameter_list) @codeium.parameters)))
    body: (_)? @body) @definition.function
  (#has-type? @definition.function function_definition declaration)
  (#select-adjacent! @doc @definition.function)
  (#lineage-from-name! "::")
  (#set! return_type_suffix "**")
)

(namespace_definition
  name: (_) @name
  (#lineage-from-name! "::")
) @definition.namespace
