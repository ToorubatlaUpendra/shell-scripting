#!/bin/bash

while getopts :a:b: options; do 
    case $options in 
        a) ap=$optarg;;
        b) bo=$optarg;;
    esac
done
echo "Option A = $ap and option B= $bo"
