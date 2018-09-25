#!/usr/bin/env bash
# Copyright 2018 mrl5
# Distributed under the terms of the GNU General Public License v3

# Creates new pdf from multiple pdfs
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

arg_err_msg="Expected minimum 2 arguments. Please specify output file and input files."

# checks if enough arguments were provided
if [ $# -lt 2 ]; then
	echo "$arg_err_msg"
	exit 1
else
	# stores args $2, $3, $4, ..., $n
	INPUT_GROUP=${@:2}
fi


# merges multiple .pdf files into one using GhostScript
merge() {
	gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE="$1" -dBATCH $INPUT_GROUP
}

# real work starts here
#check_output
#check_inputs
merge

