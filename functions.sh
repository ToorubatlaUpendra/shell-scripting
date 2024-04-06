#!/bin/bash 

NUMBER=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo "ERROR:: THE $2 IS FAILED"
        exit 1
    else
        echo "The $2 is successfull"
    fi
}
if [ $NUMBER -ne 0 ]; 
then
    echo "ERROR : Please run script with rot user"
    exit 1 
else
    echo "You are root USER"
fi

yum install mysql -y 

VALIDATE $? "Installation of Mysql"

yum install git -y 

VALIDATE $? "Git Installation"