#!/bin/bash

cd ./artifacts/

TIME_DATE=$(date)
TIME_ZONE=$(date +%Z)

for FILENAME in *.txt; do
    echo "Date: $TIME_DATE - $TIME_ZONE" >> "$FILENAME"
done