;; Import info
(import_statement
  name: [
    (dotted_name) @import.default @import.namespace @name
    (aliased_import
      name: (dotted_name) @import.default @name
      alias: (identifier) @import.namespace)
  ]) @definition.import

(import_from_statement
  module_name: [
    (dotted_name)
    (relative_import)
  ] @import.default @name
  name: [
    (dotted_name) @import.named.source
    (aliased_import
      name: (dotted_name) @import.named.source
      alias: (identifier) @import.named.alias)
  ]) @definition.import
