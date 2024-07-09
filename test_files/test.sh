#!/usr/bin/env bash
set -euo pipefail

echo "Hello World!"

do_something() {
  echo ok
}

do_nothing() { return 0; }

add() {
  sum=$(($1 + $2))
  echo $sum
}
