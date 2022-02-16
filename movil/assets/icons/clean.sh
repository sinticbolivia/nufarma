#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#$FILES=`find . -type f -name "*.svg"`

#echo $FILES

for f in *.svg; do
	svgcleaner  "$f"
done

IFS=SAVEIFS
