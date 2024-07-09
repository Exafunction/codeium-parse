;; C struct fields. Unlike for C++, there is no `class_specifier` here.

(
    (struct_specifier
        body: (
            (field_declaration_list
                (_) @field
            )
        )
    )
)
