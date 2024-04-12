#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
echo "$DISKUSAGE"
THRESHOLD=1%
while IFS= read line 
do 
    usage=$($line  | awk '{print $5}' | cut -d % -f1 )
    echo "$usage"
done < $DISKUSAGE 