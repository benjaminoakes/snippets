#!/usr/bin/env bash

# Rename PDF files by a date that each file contains as text, but isn't part of the filename.  Useful for bills, pay slips, etc.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

for f in *.pdf; do
  mv -v "$f" "`pdftotext "$f" - | ruby -e "require 'date'; md = ARGF.readlines.join.match(/Check Date: (.*?)$/); puts Date.parse(md[1])"`.pdf";
done

