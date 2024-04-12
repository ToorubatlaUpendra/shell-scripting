#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
# echo "$DISKUSAGE"
THRESHOLD=0

while IFS= read line 
do 
    usage=$(echo $line  | awk '{print $6}' | cut -d % -f1)
    echo "$usage"
    Partion=$(echo $line  | awk '{print $6}')
    echo "$Partion"
    if [ $usage -ge $THRESHOLD ]
    then
        message+="High usage on the disk $Partion:$usage"
    else
        echo "usage is below threshold"
    fi
done <<< $DISKUSAGE