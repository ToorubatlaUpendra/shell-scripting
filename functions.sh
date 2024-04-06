#!/bin/bash 

NUMBER=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ];
    then
        echo "ERROR:: THE INSTALLATION IS FAILED"
        exit 1
    else
        echo "The installation is successfull"
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

VALIDATE

yum install git -y 

VALIDATE