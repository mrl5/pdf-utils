#!/bin/bash
# Copyright 2018 mrl5
# Distributed under the terms of the GNU General Public License v3

# Creates new pdf from many pdfs
#
# $1: output file
# $2: input-1 file
# $3: input-2 file
# $n: input-n file
#
# Globs are also supported:
# $1: output file
# $2: input-* files
#
# Example 1: 'sh merge-pdf.sh /path/to/ouotput.pdf /path/to/input-1.pdf /path/to/input-2.pdf /path/to/input-n.pdf'
#  creates output.pdf from input-1.pdf, input-2.pdf, input-n.pdf
#
# Example 2: 'sh merge-pdf.sh /path/to/ouotput.pdf /path/to/input-*.pdf'
#  creates output.pdf from files matching pattern input-*.pdf

INPUT_GROUP=${@:2}

gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE="$1" -dBATCH $INPUT_GROUP
