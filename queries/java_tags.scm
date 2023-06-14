(program
  (package_declaration
    "package"
    .
    (_) @name
    .
    ";") @definition.package
  (#lineage-from-name! ".")
) @codeium.lineage_node

;; Class and record
(
  [
    (line_comment)
    (block_comment)
  ]* @doc
  .
  (class_declaration
    name: (identifier) @name
    body: (class_body)? @body
  ) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  [
    (line_comment)
    (block_comment)
  ]* @doc
  .
  (record_declaration
    name: (identifier) @name
    parameters: (formal_parameters) @body
    body: (class_body)? @body
  ) @definition.class
  (#select-adjacent! @doc @definition.class)
)


(
  [
    (line_comment)
    (block_comment)
  ]* @doc
  .
  (interface_declaration
    name: (identifier) @name) @definition.interface
  (#select-adjacent! @doc @definition.interface)
)

(
  [
    (line_comment)
    (block_comment)
  ]* @doc
  .
  (method_declaration
    name: (identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    body: (block)? @body) @definition.method
  (#select-adjacent! @doc @definition.method)
)
