#!/bin/bash

ID=$(id -u)
R="\e[m32"
Y="\e[m33"
N="\e[m0"

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
    echo -e "$RPlease login with root user$N"
    exit 1
else
    echo -e "$GYou are a root user$N"
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
        echo -e "$Rpackage is already installed$N" &&>> $LOGFILE
    fi
done