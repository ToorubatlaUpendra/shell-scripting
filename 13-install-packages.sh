#!/bin/bash

ID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "Intsallation is failed"
    else 
        echo "Installation is success" 
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
    yum list installed $PACKAGE
    if [ $? -ne 0 ]
    then
        yum install $PACKAGE
        VALIDATE
        #echo "installing as new"
    else
        echo "package is already installed"
    fi
done