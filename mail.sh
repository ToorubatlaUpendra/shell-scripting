#!/bin/bash
To_Team=$1
echo "$To_Team"
Alert_Type=$2
BODY=$3
TO_ADDRESS=$4
SUBJECT=$5
FINAL=$(sed -e 's/TO_TEAM/$To_Team/g' -e 's/Alert_Type/$Alert_type/g' -e 's/BODY/$BODY/g' template.html) #for -e for temporary change 
echo "$FINAL" | mail -s "$(echo -e "$SUBJECT\nContent-Type: text/html")" "$TO_ADDRESS"