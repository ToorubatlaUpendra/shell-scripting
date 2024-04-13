# #!/bin/bash

# R="\e[32m"
# Y="\e[33m"
# N="\e[0m"
# FILE="/etc/passwd"
# # echo "$FILE"
# if [ ! -d "$FILE" ] 
# then
#   echo -e "$R$SOURCE_DIR does exist.$N"
# fi

# while IFS=":" read -r USER_NAME PSSWORD USER_ID GROUP_ID USER_ID_INFO HOME_DIRECTORY COMMAND_SHELL
# do 
#     echo "$USER_NAME $PSSWORD "

# done < $FILE

#!/bin/bash 

DISKUSAGE=$(df -Th | grep -vE 'tmpfs|File')
# echo "$DISKUSAGE"
THRESHOLD=30
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
done <<< $DISKUSAGE

echo -e "$message"