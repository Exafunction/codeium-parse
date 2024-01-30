(file_scoped_namespace_declaration
  name: (identifier) @name) @definition.namespace
(namespace_declaration
  name: (identifier) @name) @definition.namespace

(
  (comment)* @doc
  .
  (struct_declaration
    name: (identifier) @name
    body: (declaration_list) @body) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  (comment)* @doc
  .
  (record_declaration
    name: (identifier) @name
    body: (declaration_list)? @body) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  (comment)* @doc
  .
  (enum_declaration
    name: (identifier) @name
    body: (enum_member_declaration_list) @body) @definition.enum
  (#select-adjacent! @doc @definition.enum)
)

(
  (comment)* @doc
  .
  (class_declaration
    name: (identifier) @name
    body: (declaration_list) @body) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  (comment)* @doc
  .
  (interface_declaration
    name: (identifier) @name
    body: (declaration_list) @body) @definition.interface
  (#select-adjacent! @doc @definition.interface)
)

(
  (comment)* @doc
  .
  (operator_declaration
    operator: _ @name
    body: (_) @body) @definition.method
  (#select-adjacent! @doc @definition.method)
)

(
  (comment)* @doc
  .
  (constructor_declaration
    name: (identifier) @name
    body: (_) @body) @definition.constructor
  (#select-adjacent! @doc @definition.constructor)
)

(
  (comment)* @doc
  .
  (destructor_declaration
    name: (identifier) @name
    body: (_) @body) @definition.destructor
  (#select-adjacent! @doc @definition.destructor)
)

(
  (comment)* @doc
  .
  (method_declaration
    name: (identifier) @name
    body: (_) @body) @definition.method
  (#select-adjacent! @doc @definition.method)
)
