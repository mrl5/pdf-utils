#!/bin/bash
# Copyright 2018 mrl5
# Distributed under the terms of the GNU General Public License v3

# Creates a stamp on given pdf
#
# $1: input file
#
# Example: 'sh stamp-pdf.sh /path/to/input.pdf'
#  creates input-stamp.pdf from input.pdf in current dir

# stores directory of the script
# source: https://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd -P)"
START_DIR="$(pwd -P)"
INPUT_FILE=$1
SUCCESS_MSG="Added stamp to the input file. Output file: "
FAIL_MSG="Operation failed. Aborting"

# get extension and filename
# source: https://stackoverflow.com/a/965072
filename=$(basename -- "$INPUT_FILE")
extension="${filename##*.}"
filename="${filename%.*}"
output=$START_DIR/$filename-stamp.pdf
stamp_script_location="postscript/stamp.ps"


cd $SCRIPT_DIR
gs -q -dNOPAUSE -dSAFER -dBATCH -sOutputFile=$output -sDEVICE=pdfwrite $stamp_script_location -f $START_DIR/$INPUT_FILE

# "$?" = success flag of last operation (0 = success; other = fail)
if [ $? -eq 0 ]; then
    echo $SUCCESS_MSG $output
  else
    echo $FAIL_MSG
fi

cd $START_DIR
