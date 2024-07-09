<p align="center">
  <img width="300" alt="Codeium" src="codeium.svg"/>
</p>

---

[![Discord](https://img.shields.io/discord/1027685395649015980?label=community&color=5865F2&logo=discord&logoColor=FFFFFF)](https://discord.gg/3XFf78nAx5)
[![Twitter Follow](https://img.shields.io/badge/style--blue?style=social&logo=twitter&label=Follow%20%40codeiumdev)](https://twitter.com/intent/follow?screen_name=codeiumdev)
![License](https://img.shields.io/github/license/Exafunction/codeium-parse)
[![built with Codeium](https://codeium.com/badges/main)](https://codeium.com?repo_name=exafunction%2Fcodeium-parse)

[![Visual Studio](https://img.shields.io/visual-studio-marketplace/i/Codeium.codeium?label=Visual%20Studio&logo=visualstudio)](https://marketplace.visualstudio.com/items?itemName=Codeium.codeium)
[![JetBrains](https://img.shields.io/jetbrains/plugin/d/20540?label=JetBrains)](https://plugins.jetbrains.com/plugin/20540-codeium/)
[![Open VSX](https://img.shields.io/open-vsx/dt/Codeium/codeium?label=Open%20VSX)](https://open-vsx.org/extension/Codeium/codeium)
[![Google Chrome](https://img.shields.io/chrome-web-store/users/hobjkcpmjhlegmobgonaagepfckjkceh?label=Google%20Chrome&logo=googlechrome&logoColor=FFFFFF)](https://chrome.google.com/webstore/detail/codeium/hobjkcpmjhlegmobgonaagepfckjkceh)

# codeium-parse

## _A command line tool for parsing code syntax_

This repository contains a binary built with [tree-sitter](https://github.com/tree-sitter/tree-sitter) that lets you:
* Inspect the concrete syntax tree of a source file
* Use pre-written tree-sitter query files to locate important symbols in source code
* Format output in JSON to use the results in your own applications

In particular, this repo provides a binary prepackaged with:
* A recent version of the tree-sitter library
* A large number of tree-sitter grammars
* An implementation of many common query predicates

Contributions are welcome and we encourage using this tool for any applications that involve code syntax analysis. For example, these queries are used by [Codeium Search](https://www.codeium.com/about_codeium_search) to index code locally for repo-wide semantic search. If you use Codeium Search, adding queries for your language here will enable it to work better on your own code!

## Example

(Requires [fd](https://github.com/sharkdp/fd) and [jq](https://github.com/stedolan/jq).)

```shell
# Print all names and arguments from function definitions.
fd -e js \
  | xargs -i ./parse -quiet -use_tags_query -json -json_include_path -file '{}' \
  | jq -r '.
    | select(.captures."definition.function" != null)
    | .file + ":" + .captures.name[0].text + .captures."codeium.parameters"[0].text'
# Output:
# examples/example.js:add(a, b)
```

## Getting started

```console
$ ./download_parse.sh
$ ./parse -file examples/example.js -named_only
program [0, 0] - [4, 0] "// Adds two numbers.\n…"
  comment [0, 0] - [0, 20] "// Adds two numbers."
  function_declaration [1, 0] - [3, 1] "function add(a, b) {\n…"
    name: identifier [1, 9] - [1, 12] "add"
    parameters: formal_parameters [1, 12] - [1, 18] "(a, b)"
      identifier [1, 13] - [1, 14] "a"
      identifier [1, 16] - [1, 17] "b"
    body: statement_block [1, 19] - [3, 1] "{\n…"
      return_statement [2, 4] - [2, 17] "return a + b;"
        binary_expression [2, 11] - [2, 16] "a + b"
          left: identifier [2, 11] - [2, 12] "a"
          right: identifier [2, 15] - [2, 16] "b"
$ ./parse -file examples/example.js -use_tags_query -json | jq ".captures.doc[0].text"
"// Adds two numbers."
```

## Support status

### Queries

Queries try to follow the [conventions established by tree-sitter.](https://tree-sitter.github.io/tree-sitter/code-navigation-systems)

Most captures also include documentation as `@doc`. `@definition.function` and `@definition.method` also capture `@codeium.parameters`.

| Top-level capture         | Python | TypeScript | JavaScript | Go  | Java | C++   | PHP | Ruby | C#  | Perl  | Kotlin | Dart  | Bash | C   |
| ------------------------- | ------ | ---------- | ---------- | --- | ---- | ----- | --- | ---- | --- | ----- | ------ | ----- | ---- | --- |
| `@definition.class`       | ✓      | ✓          | ✓          | ✓   | ✓    | ✓     | ✓   | ✓    | ✓   | ✓     | ✓      | ✓     | ✗    | ✗   |
| `@definition.function`    | ✓      | ✓[^3]      | ✓          | ✓   | N/A  | ✓     | ✓   | N/A  | N/A | ✓     | ✓      | ✓     | ✓    | ✓   |
| `@definition.method`      | ✓[^1]  | ✓[^3]      | ✓          | ✓   | ✓    | ✓[^1] | ✓   | ✓    | ✓   | ✓[^1] | ✓      | ✓[^1] | ✓    | ✓   |
| `@definition.constructor` | ✓      | ✓          | ✓          | N/A | ✗    | ✗     | ✗   | ✗    | ✓   | ✗     | ✓      | ✗     | N/A  | N/A |
| `@definition.interface`   | N/A    | ✓          | N/A        | ✓   | ✓    | N/A   | ✓   | ✗    | ✓   | N/A   | ✗      | ✗     | N/A  | N/A |
| `@definition.namespace`   | N/A    | ✓          | N/A        | N/A | N/A  | ✓     | ✓   | N/A  | ✓   | ✗     | ✗      | N/A   | N/A  | N/A |
| `@definition.module`      | N/A    | ✓          | N/A        | N/A | N/A  | ✗     | N/A | ✓    | N/A | N/A   | N/A    | ✗     | N/A  | N/A |
| `@definition.type`        | N/A    | ✓          | N/A        | ✓   | N/A  | ✗     | ✗   | N/A  | N/A | N/A   | N/A    | ✗     | N/A  | N/A |
| `@definition.constant`    | ✗      | ✗          | ✗          | ✗   | ✗    | ✗     | ✗   | ✗    | ✗   | ✗     | ✗      | ✗     | N/A  | ✗   |
| `@definition.enum`        | ✗      | ✗          | ✗          | ✗   | ✗    | ✗     | ✗   | N/A  | ✓   | N/A   | ✗      | ✗     | N/A  | ✗   |
| `@definition.import`      | ✓      | ✓          | ✓          | ✗   | ✗    | ✗     | N/A | ✓    | ✗   | ✓     | ✓      | ✗     | N/A  | ✓   |
| `@definition.include`     | N/A    | N/A        | N/A        | N/A | N/A  | ✗     | ✗   | N/A  | N/A | N/A   | N/A    | N/A   | N/A  | N/A |
| `@definition.package`     | N/A    | N/A        | N/A        | ✓   | ✓    | N/A   | N/A | N/A  | N/A | N/A   | N/A    | N/A   | N/A  | N/A |
| `@reference.call`         | ✓      | ✓          | ✓          | ✓   | ✗    | ✗     | ✗   | ✓    | ✗   | ✗     | ✗      | ✗     | ✗    | ✗   |
| `@reference.class`        | ✓[^2]  | ✓          | ✓          | ✓   | ✗    | ✗     | ✗   | ✗    | ✗   | ✗     | ✗      | ✗     | N/A  | N/A |

| Language | Supported injections   |
| -------- | ---------------------- |
| Vue      | JavaScript, TypeScript |
| HTML     | JavaScript             |

[^1]: Currently functions and methods are not distinguished.
[^2]: Function calls and class instantiation are indistinguishable in Python.
[^3]: Function and method signatures are captured individually in TypeScript. Therefore, the `@doc` capture may not exist on all nodes.

Want to write a query for a new language? `tags.scm` and other queries in each language's tree-sitter repository, [like tree-sitter-javascript](https://github.com/tree-sitter/tree-sitter-javascript/blob/5720b249490b3c17245ba772f6be4a43edb4e3b7/queries/tags.scm), are a good place to start.

### Query predicates

```console
$ ./parse -supported_predicates
#eq?/#not-eq?
    (#eq? <@capture|"literal"> <@capture|"literal">)
    Checks if two values are equal.

#has-parent?/#not-has-parent?
    (#has-parent? @capture node_type...)
    Checks if @capture has a parent node of any of the given types.

#has-type?/#not-has-type?
    (#has-type? @capture node_type...)
    Checks if @capture has a node of any of the given types.

#lineage-from-name!
    (#lineage-from-name! "literal")
    If the name captures scopes, split by "literal" and retain the last element
    as the name. The other elements are appended to the lineage.

#match?/#not-match?
    (#match? @capture "regex")
    Checks if the text for @capture matches the given regular expression.

#select-adjacent!
    (#select-adjacent! @capture @anchor)
    Selects @capture nodes contiguous with @anchor (all starting and ending on
    adjacent lines).

#set!
    (#set! key <@capture|"literal">)
    Store metadata as a side effect of a match.

#strip!
    (#strip! @capture "regex")
    Removes all matching text from all @capture nodes.
```

Need a predicate which hasn't been implemented? [File an issue!](https://github.com/Exafunction/codeium-parse/issues/new) We try to use [predicates from nvim-treesitter.](https://github.com/nvim-treesitter/nvim-treesitter/blob/980f0816cc28c20e45715687a0a21b5b39af59eb/lua/nvim-treesitter/query_predicates.lua)

### Grammars

```console
$ ./parse -supported_languages
ada
c
cpp
csharp
css
dart
go
hcl
html
java
javascript
json
julia
kotlin
latex
markdown
ocaml
ocaml_interface
perl
php
protobuf
python
ruby
rust
shell
svelte
swift
toml
tree_sitter_query
tsx
typescript
vue
yaml
```

Looking for support for another language? [File an issue](https://github.com/Exafunction/codeium-parse/issues/new) with a link to the repo that contains the grammar.

## Contributing

Pull requests are welcome. For non-issue discussions about `codeium-parse`, [join
our Discord.](https://discord.gg/3XFf78nAx5)

### Adding and testing queries

* You can create new source files with patterns you want to target in `test_files/`.
* Look at the syntax tree using `./parse -file test_files/<your file>` to get a sense of how to capture the pattern.
* Learn the query syntax from [tree-sitter documentation.](https://tree-sitter.github.io/tree-sitter/using-parsers#pattern-matching-with-queries)
* Run `./goldens.sh` to see what your query captures.
