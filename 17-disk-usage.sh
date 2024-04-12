#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
echo "$DISKUSAGE"
THRESHOLD=1%
while IFS= read line 
do 
    echo "$line"
done < $DISKUSAGE 