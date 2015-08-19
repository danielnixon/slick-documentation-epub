#!/bin/bash

set -e
set -u

git submodule init
git submodule updat

command -v sphinx-build >/dev/null 2>&1 || { echo "Missing command 'sphinx-build'. Try 'pip install Sphinx'." >&2; exit 1; }

export version="3.0.2" release="3.0.2"

sphinx-build -b epub slick/slick/src/sphinx/ output

ebook-convert output/Slick.epub output/Slick.mobi
