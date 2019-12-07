#!/bin/bash

read -p 'Enter batch no: ' batchno
VALUE=$(cat courses.yml | yq . | jq ".b${batchno}")
if [ "$VALUE" = "null" ]; then
  echo "Given batch number doesnot exist"
  exit 1
fi

##NAMES=('cat courses.yml | yq . | jq '.b42.students[].name'|xargs')
##EMAILS=('cat courses.yml | yq . | jq '.b42.students[].email'|xargs')

##VALUE_NO=$(echo ${#NAMES[*]})

##while [ \
##\
