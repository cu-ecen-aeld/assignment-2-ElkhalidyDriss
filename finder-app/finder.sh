#!/bin/sh
filesdir=$1
searchstr=$2
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
   echo "one of the arguments is empty"
   exit 1
fi
if [ ! -d "$filesdir" ]; then
   echo "Error : '$filesdir' is not a directory"
   exit 1
fi
files_count=$(find "$filesdir" -type f | wc --lines)
matching_lines_count=$(find "$filesdir" -type f -exec grep -H "$searchstr" {} + | wc -l)
echo "The number of files are $files_count and the number of matching lines are $matching_lines_count"


