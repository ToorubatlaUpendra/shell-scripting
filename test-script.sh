#!/bin/bash

R="\e[32m"
Y="\e[33m"
N="\e[0m"
FILE="/etc/passwd"
echo "$FILE"
if [ ! -d "$FILE" ] 
then
  echo -e "$R$SOURCE_DIR does exist.$N"
fi

while IFS=":" read -r USER_NAME PSSWORD USER_ID GROUP_ID USER_ID_INFO HOME_DIRECTORY COMMAND_SHELL
do 
    echo "$USER_NAME $PSSWORD "

done <<< $FILE