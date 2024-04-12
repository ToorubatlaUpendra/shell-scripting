#!/bin/bash

R="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR="/tmp/shell-scripting"
if [ ! -d "$SOURCE_DIR" ] 
then
  echo -e "$R$SOURCE_DIR does exist.$N"
fi
FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
   echo "DELETING FILE LINE BY LINE:$line"
   rm -rf $line
done <<< $FILES_TO_DELETE