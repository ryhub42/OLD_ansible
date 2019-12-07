#!/bin/bash

read -p 'Enter batch no: ' batch_no
VALUE=$(cat courses.yml | yq . | jq ".b${batch_no}")
if [ "$VALUE" = "null" ]; then
  echo "Given batch number doest exist"
  exit 1
fi

NAMES=(`cat courses.yml | yq . | jq ".b${batch_no}.students[].name"|xargs`)
EMAILS=(`cat courses.yml | yq . | jq .b${batch_no}.students[].email|xargs`)
TRAINER_NAME=$(cat courses.yml  | yq . | jq .b${batch_no}.trainer_name |xargs)
COURSE_NAME=$(cat courses.yml  | yq . | jq .b${batch_no}.course_name|xargs)
COURSE_TIME=$(cat courses.yml  | yq . | jq ".b${batch_no}.timing"|xargs)

VALUE_NO=$(echo ${#NAMES[*]})

while [ $VALUE_NO -gt 0 ]; do
  VALUE_NO=$(($VALUE_NO-1))
  echo -e "Hello ${NAMES[$VALUE_NO]}, A new batch of $COURSE_NAME @$COURSE_TIME by $TRAINER_NAME is getting started from Monday, I am sending an email to ${EMAILS[$VALUE_NO]}, Please respond if you have any queries."
done