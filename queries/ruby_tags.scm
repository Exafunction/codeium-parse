; Method definitions

(
  (comment)* @doc
  .
  [
    (method
      name: (_) @name
      parameters: (method_parameters)? @codeium.parameters
      body: (_) @body
    )
    (singleton_method
      name: (_) @name
      parameters: (method_parameters)? @codeium.parameters
      body: (_) @body
    )
  ] @definition.method
  (#select-adjacent! @doc @definition.method)
)

(alias
  name: (_) @name) @definition.method


; Class definitions

(
  (comment)* @doc
  .
  (class
    name: (_) @name) @definition.class
  (#lineage-from-name! "::")
  (#select-adjacent! @doc @definition.class)
)

; Module definitions

(
  (comment)* @doc
  .
  (module
    name: (_) @name) @definition.module
  (#lineage-from-name! "::")
  (#select-adjacent! @doc @definition.module)
)

; Calls

(
  call method: [(identifier) (constant)] @name
  (#not-match? @name "^(lambda|load|require|require_relative|__FILE__|__LINE__)$")
) @reference.call


(
  call method: [(identifier) (constant)] @name
  (#match? @name "^(require|require_relative)$")
) @definition.import
