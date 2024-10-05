;; For class_declaration
(
    (class_body
        ([
            (public_field_definition)
        ]) @field
    )
)
;; For type_alias_declaration, whose body is an object_type
(
    (object_type
        [
          (property_signature) @field
          (construct_signature) @definition.constructor
          (_)
        ]
    )
)
;; For interface_declaration, whose body is an object_type
(
    (interface_body
        [
          (property_signature) @field
          (construct_signature) @definition.constructor
          (_)
        ]
    )
)
