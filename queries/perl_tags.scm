;; Tags for parsing Perl class statements
(
  (class_statement
    name: (package) @name
    (block) @body
  ) @definition.class
)

;; Tags for parsing Perl functions (subroutines)

(
  (comment)* @doc
  .
  [
    (subroutine_declaration_statement
      name: (bareword) @name
      (prototype_or_signature)? @codeium.parameters
      body: (block) @body) @definition.function
    (method_declaration_statement
      name: (bareword) @name
      (prototype_or_signature)? @codeium.parameters
      body: (block) @body) @definition.function
  ]
  (#select-adjacent! @doc @definition.function)
)

;; Tags for parsing Perl imports

(
  source_file
  (
    use_statement
      module: (package) @name
  ) @definition.import
)
