#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
# echo "$DISKUSAGE"
THRESHOLD=10
while IFS= read line 
do 
    usage=$(echo $line  | awk '{print $6}' | cut -d % -f1)
    Partion=$(echo $line  | awk '{print $1}')
    if [ $usage -ge $THRESHOLD ]
    then
        message+="High usage on the disk $Partion:$usage\n" #for over writing
    else
        echo "usage is below threshold"
    fi
done <<< $DISKUSAGE #content we are pushing so we are using <<< 

# echo -e "$message" | mail -s "Alert" toorubatlaupendra@gmail.com

sh mail.sh "Devops Team" "High Disk Usage" "$message" "toorubatlaupendra@gmail.com" "Alert High Disk Usage"
