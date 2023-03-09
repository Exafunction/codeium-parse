#!/bin/bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
for test_file in test_files/*; do
    test_file="$(basename "$test_file")"
    echo "$test_file"
    ./parse -file "test_files/$test_file" -use_tags_query -tags_query_dir "queries" > "goldens/$test_file.golden.tmp"
    trap 'rm "goldens/$test_file.golden.tmp"' EXIT
    diff -u "goldens/$test_file.golden" "goldens/$test_file.golden.tmp"
done
