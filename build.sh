#!/bin/bash

set -e
set -u

git submodule init
git submodule update

command -v sphinx-build >/dev/null 2>&1 || { echo "Missing command 'sphinx-build'. Try 'pip install Sphinx'." >&2; exit 1; }

export version="3.0.2" release="3.0.2"
export slick_extensions_version="3.0.0"

sphinx-build -b epub slick/slick/src/sphinx/ output
