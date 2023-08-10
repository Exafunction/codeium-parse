; Method definitions

(
  (comment)* @doc
  .
  [
    (method
      name: (_) @name
      parameters: (method_parameters) @codeium.parameters
      body: (_) @body
    ) @definition.method
    (singleton_method
      name: (_) @name
      parameters: (method_parameters) @codeium.parameters
      body: (_) @body
    ) @definition.method
  ]
  (#strip! @doc "^#\\s*")
  (#select-adjacent! @doc @definition.method)
)

(alias
  name: (_) @name) @definition.method

(setter
  (identifier) @ignore)

; Class definitions

(
  (comment)* @doc
  .
  [
    (class
      name: [
        (constant) @name
        (scope_resolution
          name: (_) @name)
      ]) @definition.class
    (singleton_class
      value: [
        (constant) @name
        (scope_resolution
          name: (_) @name)
      ]) @definition.class
  ]
  (#select-adjacent! @doc @definition.class)
)

; Module definitions

(
  (module
    name: [
      (constant) @name
      (scope_resolution
        name: (_) @name)
    ]) @definition.module
)

; Calls

(call method: (identifier) @name) @reference.call

(
  [(identifier) (constant)] @name @reference.call
  (#not-match? @name "^(lambda|load|require|require_relative|__FILE__|__LINE__)$")
)
