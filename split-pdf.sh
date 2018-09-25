#!/usr/bin/env bash
# Copyright 2018 mrl5
# Distributed under the terms of the GNU General Public License v3

# Creates new pdf from part of another pdf
#
# $1: input file
# $2: output file
# $3: first range
# $4: second range
# $n-2: nth range
#
# Example: 'sh split-pdf.sh /path/to/input.pdf /path/to/output.pdf 1-1 6-9 18-21'
#  creates output.pdf from input.pdf pages: 1, 6, 7, 8, 9, 18, 19, 20, 21

TMPNAME="temp-pdf-snapshot"
TMPDIR="/tmp/temp-pdf-snapshots-$(tr -dc A-Za-z0-9_ < /dev/urandom | head -c 16 | xargs)"

# stores directory of the script
# source: https://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "$0" )" >/dev/null && pwd -P)"

# get directory of /path/to/outputfile.pdf file
OUTPUTDIR=${2%/*}

if [ $OUTPUTDIR == $2 ]
then
    OUTPUTDIR="."
fi

mkdir $TMPDIR

INDEX=1
# start loop from 3rd argument
for RANGE in ${@:3}
do
    START=$(echo $RANGE | cut -d'-' -f1)
    END=$(echo $RANGE | cut -d'-' -f2)

    # create new pdf from range $START-$END
    #'$(printf "%04g" $INDEX)' = padding $INDEX with leading zeros
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER -dFirstPage=$START -dLastPage=$END -sOutputFile=$TMPDIR/$TMPNAME-$(printf "%04g" $INDEX).pdf "$1"

    ((INDEX++))
done

# merge all 'temp-pdf-snapshot' files into one output.pdf
sh $SCRIPT_DIR/merge-pdf.sh $2 $TMPDIR/$TMPNAME*.pdf

#rm -rf $TMPDIR
