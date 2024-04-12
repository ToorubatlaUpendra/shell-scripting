#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
THRESHOLD=1%
while IFS= read -r line 
do 
    echo "$line"
done < $DISKUSAGE 