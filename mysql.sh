#!/bin/bash 

NUMBER=$(id -u)
if [ $NUMBER -ne 0 ]; 
then
    echo "ERROR : Please run script with rot user"
    exit 1 
else
    echo "You are root USER"
fi

yum install mysl -y 

if [ $? -ne 0 ];
then
    echo "ERROR:: THE INSTALLATION IS FAILED"
    exit 1
else
    echo "The installation is successfull"
fi

yum install git -y 

if[ $? -ne 0 ]
then
    echo "GIT installation is failed"
    exit 1
else 
    echo "installation is success"
fi

