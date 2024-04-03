#!/bin/bash 

NUMBER=$(id -u)
if [ $NUMBER -ne 0 ]; 
then
    echo "ERROR : Please run script with rot user"
else
    echo "You are root USER"
fi