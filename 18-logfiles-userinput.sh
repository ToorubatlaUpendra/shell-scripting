#!/bin/bash

OPTSTRING=":x:y:"

while getopts ${OPTSTRING} opt; do
  case ${opt} in
    x)
      echo "Option -x was triggered, Argument: ${OPTARG}"
      ;;
    y)
      echo "Option -y was triggered, Argument: ${OPTARG}"
      ;;
    :)
      echo "Option -${OPTARG} requires an argument."
      exit 1
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done