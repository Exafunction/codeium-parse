;; 1. Any possible message body value can be parsed as a class field.
(message_body
    (field)? @field
    (message)? @field
    (oneof)? @field
    (enum)? @field
    (map_field)? @field
    (enum_field)? @field
)

;; 2. Parse enum values as class fields
(enum_body
    (enum_field) @field
)
