#!/bin/bash

set -e
set -u

git submodule init
git submodule update

command -v sphinx-build >/dev/null 2>&1 || { echo "Missing command 'sphinx-build'. Try 'pip install Sphinx'." >&2; exit 1; }

export version="3.0" release="3.0.2"
export slick_extensions_version="3.0.0"

sphinx-build -b epub slick/slick/src/sphinx/ output

if hash ebook-convert 2>/dev/null; then
  ebook-convert ./output/Slick.epub ./output/Slick.mobi
else
  echo "Missing command 'ebook-convert', cannot convert to mobi. Try 'brew cask install calibre'."
fi
