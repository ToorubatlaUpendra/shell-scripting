#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File' | awk '{print $6}' | cut -d % -f1)
echo "$DISKUSAGE"
# THRESHOLD=1

# while IFS= read line 
# do 
#     usage=$(echo $line  | awk '{print $6}' | cut -d % -f1 )
#     echo "$usage"
# done <<< $DISKUSAGE