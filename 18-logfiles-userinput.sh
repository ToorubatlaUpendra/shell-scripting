#!/bin/bash

# Initialize variables for optional arguments
optional_arg1=""
optional_arg2=""
optional_arg3=""

# Function to display usage
usage() {
    echo "Usage: $0 -s <arg1> -a <arg2> [-d <arg3>] [-t <arg4>] [-m <arg5>]"
    exit 1
}

# Use getopts to parse options
while getopts ":s:a:d:t:m:" opt; do
    case ${opt} in
        s ) mandatory_arg1="$OPTARG"
            ;;
        a ) mandatory_arg2="$OPTARG"
            ;;
        d ) optional_arg1="$OPTARG"
            ;;
        t ) optional_arg2="$OPTARG"
            ;;
        m ) optional_arg3="$OPTARG"
            ;;
        \? ) echo "Invalid option: $OPTARG" 1>&2
             usage
            ;;
        : ) echo "Option -$OPTARG requires an argument." 1>&2
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Check for mandatory arguments
if [[ -z "$mandatory_arg1" || -z "$mandatory_arg2" ]]; then
    echo "Mandatory arguments -s and -a are required."
    usage
    if [ $mandatory_arg2="archieve" ]
    then
        if [ -z "$optional_arg1" ]
        then
            echo "Mandatory argument -d is required."
            usage
        fi
fi

# Output the values
echo "Mandatory Argument 1: $mandatory_arg1"
echo "Mandatory Argument 2: $mandatory_arg2"
echo "Optional Argument 1: $optional_arg1"
echo "Optional Argument 2: $optional_arg2"
echo "Optional Argument 3: $optional_arg3"
