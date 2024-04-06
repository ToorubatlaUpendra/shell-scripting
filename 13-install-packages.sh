#!/bin/bash

ID=$(id -u)
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
    echo "Please login with root user"
    exit 1
else
    echo  "You are a root user"
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
        echo "package is already installed" &&>> $LOGFILE
    fi
done