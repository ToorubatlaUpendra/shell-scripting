#!/bin/bash 

NUMBER=$(id -u)
if [ $NUMBER -ne 0 ]; 
then
    echo "ERROR : Please run script with rot user"
    exit 1 
else
    echo "You are root USER"
fi

yum install mysql