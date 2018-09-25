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

# checks if enough arguments were provided
if [ $# -lt 2 ]; then
	echo "Expected minimum 2 arguments. Please specify output file and input files."
	exit 1
else
	OUTPUT="$1"
	# stores args $2, $3, $4, ..., $n
	INPUT_GROUP="${@:2}"
fi

# checks if output file exists
check_output() {
	ow_msg="$OUTPUT already exists. Do you want to overwrite it? [yes/no]: "
	abort_msg="Aborting."

	if [ -f "$OUTPUT" ]; then
		# ask to overwrite
		read -p "$ow_msg" answr
		
		while [[ -z $answr ]]; do
			answr="yes"
		done

		# Convert $answr to lower cases
		ovrwrt=${answr,,}
		case $ovrwrt in
			no)
				echo $abort_msg
				exit 1
				;;
			n)
				echo $abort_msg
				exit 1
				;;
			yes)
				;;
			y)
				;;
			*)
				echo "Wrong answer."
				check_output
				;;
		esac
	fi
}

# checks if input files exist
check_inputs() {
	for file in $INPUT_GROUP; do
		if [ ! -f $file ]; then
			echo "$file doesn't exist. Aborting."
			exit 1
		fi
	done
}

# merges multiple .pdf files into one using GhostScript
merge() {
	echo Creating $OUTPUT ...
	echo ""
	gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE="$OUTPUT" -dBATCH $INPUT_GROUP
	# checks if last command returned error
	if [ $? -eq 0 ]; then
		echo ""
		echo "Done. New PDF: $OUTPUT"
	else
		echo ""
		echo "Something went wrong. $OUTPUT may be corrupted."
	fi
}

# main()
check_output
check_inputs
merge

