#!/bin/bash

ID=$(id -u)
R="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.sh"
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo " $PACKAGE Installation is failed"
    else 
        echo "  $PACKAGE Installation is success"
    fi 
}
if [ $ID -ne 0 ]
then
    echo -e "$R Please login with root user$N"
    exit 1
else
    echo -e "$G You are a root user$N"
fi
for PACKAGE in $@
do
    yum list installed $PACKAGE &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $PACKAGE &>> $LOGFILE
        VALIDATE $PACKAGE
        #echo "installing as new"
    else
        echo -e "$R package is already installed $N" &&>> $LOGFILE
    fi
done