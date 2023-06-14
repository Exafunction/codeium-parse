;; For class_declaration
(
    (class_body
        ([
            (public_field_definition)
        ]) @field
    )
)
;; For type_alias_declaration and interface_declaration, whose body is an object_type
(
    (object_type
        [
          (property_signature) @field
          (construct_signature) @codeium.constructor
          (_)
        ]
    )
)

(
  (comment)* @doc
  .
  (_
    name: (property_identifier) @name
    parameters: (formal_parameters) @codeium.parameters
    return_type: ([
      (type_annotation (_) @codeium.return_type)
      (asserts (_) @codeium.return_type)
      (type_predicate_annotation (_) @codeium.return_type)
    ])?
    body: (_)? @body) @codeium.constructor
  (#eq? @name "constructor")
  (#has-type? @codeium.constructor method_definition method_signature abstract_method_signature)
  (#select-adjacent! @doc @codeium.constructor)
)
