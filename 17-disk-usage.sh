#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File' | awk '{print $6}' | cut -d % -f1)
# echo "$DISKUSAGE"
THRESHOLD=1

while IFS= read line 
do 
    usage=$(echo $line  | awk '{print $6}' | cut -d % -f1 )
    Partion=$(echo $line  | awk '{print $6}')
    if [ $usage -ge $THRESHOLD ]
    then
        message+="High usage on the disk $Partion:$usage"
    else
        echo "usage is below threshold"
    fi
done <<< $DISKUSAGE