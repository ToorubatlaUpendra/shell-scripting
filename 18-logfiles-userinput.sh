#!/bin/bash

# steps:::::
# 1)providing the required arguments
# 2)correct ga options esthunana ledha and options ki ayrgument esthunana ledha
# 3)making two arguments as mandotory
# 4)
while getopts ":s:a:d:t:m" opt; do
  case ${opt} in
    s )
      arg1=$OPTARG
      ;;
    a )
      arg2=$OPTARG
      ;;
    d )
      arg3=$OPTARG
      ;;
    t )
      arg2=$OPTARG
      ;;
    m )
      arg2=$OPTARG
      ;;

    \? )
      echo "Invalid option: $OPTARG"  #this will though error if we give any wrong option
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument." #it will tell this requires an argument 
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z "$arg1" ]
then
    echo "usage:$0  -a <arg1>"
    exit 1
fi