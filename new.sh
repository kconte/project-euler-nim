#!/bin/bash
set -euo pipefail

[ ! $# -ge 1 ] && echo "no problem number provided" && exit 1

FILENAME="./solvers/p$(printf "%03d" $1).nim"
[ -f "$FILENAME" ] && echo "problem exists, opening..." && code $FILENAME && exit 0

echo "creating new solver from template..."
cat > $FILENAME <<EOF
import ../lib/globals
import ../lib/templates

euler $1:
  solution:
    NotImplemented
EOF

echo "configuring Makefile..."
python3 configure.py

echo "opening new solver..."
code $FILENAME
