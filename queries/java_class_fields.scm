(class_declaration
    (class_body
        (field_declaration) @field
    )
)
(class_declaration
    (class_body
        ([
            (constructor_declaration)
        ]) @definition.constructor
    )
)

(record_declaration
    (formal_parameters
        (formal_parameter) @field
    )
)
(record_declaration
    (class_body
        ([
            (constructor_declaration)
            (compact_constructor_declaration)
        ]) @definition.constructor
    )
)
