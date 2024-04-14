#!/bin/bash

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