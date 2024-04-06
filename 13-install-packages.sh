#!/bin/bash

ID=$(id -u)
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
    else
        echo "package is already installed"
done