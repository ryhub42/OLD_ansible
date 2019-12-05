#!/bin/bash

read -p 'Enter batch no: 'batchno
VALUE=$(cat courses.yaml | yq . | jq ".b${batchno}")
if [ $VALUE = "null" ]; then
  echo "Given batch number doesn't exist"
  exit 1
fi