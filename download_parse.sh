#!/bin/bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
VERSION="v0.0.4"
rm -f parse.gz parse
curl -Lo parse.gz "https://github.com/Exafunction/codeium-parse/releases/download/$VERSION/parse.gz"
gzip -d parse.gz
chmod +x parse
