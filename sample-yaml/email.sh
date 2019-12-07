#!/bin/bash

read -p 'Enter batch no: ' batchno
VALUE=$(cat courses.yml | yq . | jq ".b${batchno}")
if [ "$VALUE" = "null" ]; then
  echo "Given batch number doesnot exist"
  exit 1
fi

NAMES=('cat courses.yml | yq . | jq '.b42.students[].name'|xargs')
EMAILS=('cat courses.yml | yq . | jq '.b42.students[].email'|xargs')
TRAINER_NAME
COURSE_NAME
COURSE_TIME

VALUE_NO=$(echo ${#NAMES[*]})

while [  $VALUE_NO -gt 0 ]; do
  VALUE_NO=$(($VALUE_NO-1))
  echo -e "Hello ${NAMES[$VALUE_NO]}, A new batch of $COURSE_NAME @ $COURSE_TIME by $TRAINER_NAME will being from monday and sending class info to ${EMAILS[$VALUE_NO]}"
done
