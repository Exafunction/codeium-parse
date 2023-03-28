;; Import info
(import_statement
  (import_clause
    (namespace_import
      (identifier) @import.namespace
    )?
    (identifier)? @import.default
    (named_imports
      .
      (
        [
          _
          (import_specifier
            name: (identifier) @import.named.source
            alias: (identifier)? @import.named.alias
          )
        ]
      )*
    )?
  )?
  source: (string) @name
) @definition.import
