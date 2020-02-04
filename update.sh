#!/bin/bash
set -e

which bibtex2html > /dev/null || (
  echo 'bibtex2html not found. Please install it from'
  echo 'https://www.lri.fr/~filliatr/bibtex2html/'
  echo 'or on Mac, run `brew install bibtex2html`'
  exit 1
)

bibtex2html --dl --nodoc --title 'CRDT Papers' papers.bib

sed -e $'1s/^/---\\\nlayout: page\\\ntitle: CRDT Papers\\\n---\\\n/' -i '' papers.html

sed -e 's/<h1>papers.bib<\/h1>/<h1>CRDT Papers<\/h1>/' \
    -e $'1s/^/<!DOCTYPE html>\\\n<meta charset="utf-8">\\\n/' -i '' papers_bib.html
