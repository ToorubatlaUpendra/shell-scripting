#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
echo "$DISKUSAGE"
THRESHOLD=1%
while IFS= read -r line 
do 
     message+=$("$line  | awk '{print $5}')
     echo "$message"
done < $DISKUSAGE 