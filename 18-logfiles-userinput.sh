#!/bin/bash

# Initialize variables for optional arguments
optional_arg1=""
optional_arg2=""
optional_arg3=""

# Function to display usage
usage() {
    echo "Usage: $0 -a <arg1> -b <arg2> [-c <arg3>] [-d <arg4>] [-e <arg5>]"
    exit 1
}

# Use getopts to parse options
while getopts ":a:b:c:d:e:" opt; do
    case ${opt} in
        a ) mandatory_arg1="$OPTARG"
            ;;
        b ) mandatory_arg2="$OPTARG"
            ;;
        c ) optional_arg1="$OPTARG"
            ;;
        d ) optional_arg2="$OPTARG"
            ;;
        e ) optional_arg3="$OPTARG"
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
    echo "Mandatory arguments -a and -b are required."
    usage
fi

# Output the values
echo "Mandatory Argument 1: $mandatory_arg1"
echo "Mandatory Argument 2: $mandatory_arg2"
echo "Optional Argument 1: $optional_arg1"
echo "Optional Argument 2: $optional_arg2"
echo "Optional Argument 3: $optional_arg3"
