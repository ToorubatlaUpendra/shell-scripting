#!/bin/bash

while getopts a:b: options; do 
    case $options in 
        a) ap=$options;;
        b) bo=$options;;
    esac
done
echo "Option A = $ap and option B= $bo"
