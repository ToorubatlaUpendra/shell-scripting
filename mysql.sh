#!/bin/bash 

NUMBER=$(id -u)
if [ $NUMBER == 10 ]; then
    echo "Proceed"
else
    echo "ERROR : Please run the script with roo access"
fi