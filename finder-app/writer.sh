#!/bin/sh

writefile=$1
writestr=$2

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
   echo "Error : not all the arguments are specified"
   exit 1
fi
mkdir -p "$(dirname "$writefile")"
echo "$writestr" > "$writefile"
if [ $? -ne 0  ]; then
   echo "Couldn't create file '$writefile'"
   exit 1
fi
