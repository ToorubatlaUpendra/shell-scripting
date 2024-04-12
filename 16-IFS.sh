#!/bin/bash

R="\e[m32"
Y="\e[m33"
N="\e[m0"
FILE="/etc/passwd"
if [ ! -d "$FILE" ] 
then
  echo -e "$R$SOURCE_DIR does exist.$N"
fi

while IFS=":" read -r USER_NAME PSSWORD USER_ID GROUP_ID USER_ID_INFO HOME_DIRECTORY COMMAND_SHELL
do 
    echo "$USER_NAME $PSSWORD "
done > "$FILE"

