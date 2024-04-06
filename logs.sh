#!/bin/bash 

NUMBER=$(id -u)
R="\e[31m"
G="\e[32m"
E="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "Script name : $0"

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo "ERROR:: $R THE $2 IS FAILED"
        exit 1
    else
        echo "The $G $2 is successfull"
    fi
}
if [ $NUMBER -ne 0 ]; 
then
    echo "$R ERROR $E: Please run script with rot user"
    exit 1 
else
    echo "You are root USER"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installation of Mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "Git Installation"