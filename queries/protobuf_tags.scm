(source_file
  (package
    (full_ident) @name) @definition.package
  (#lineage-from-name! ".")
) @codeium.lineage_node

(
  (comment)* @doc
  .
  (message
    (message_name) @name
    (message_body) @body) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  (comment)* @doc
  .
  (enum
    (enum_name) @name
    (enum_body) @body) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  (comment)* @doc
  .
  (service
    (service_name) @name) @definition.class
  (#select-adjacent! @doc @definition.class)
)

(
  (comment)* @doc
  .
  (rpc
    (rpc_name) @name) @definition.function
  (#select-adjacent! @doc @definition.function)
)
