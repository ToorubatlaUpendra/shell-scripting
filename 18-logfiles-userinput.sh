#!/bin/bash

while getopts ":a:b:" opt; do
  case ${opt} in
    a )
      arg1=$OPTARG
      ;;
    b )
      arg2=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG"
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))