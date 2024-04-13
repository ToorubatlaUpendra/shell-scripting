#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
# echo "$DISKUSAGE"
THRESHOLD=10
while IFS= read  line 
do 
    echo "$line"
    usage=$(echo $line  | awk '{print $6}' | cut -d % -f1)
    echo "$usage"
    Partion=$(echo $line  | awk '{print $1}')
    # echo "$Partion"
    if [ $usage -ge $THRESHOLD ]
    then
        message+="High usage on the disk $Partion:$usage\n" #for over writing
    fi
done <<< "$DISKUSAGE" #content we are pushing so we are using <<< here use qoutes otherwise it will take as single line

# echo -e "$message" | mail -s "Alert" toorubatlaupendra@gmail.com

# echo "$message"
 sh mail.sh "Devops Team" "High Disk Usage" "$message" "toorubatlaupendra@gmail.com" "Alert High Disk Usage"
