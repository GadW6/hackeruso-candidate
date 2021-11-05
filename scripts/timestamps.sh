#!/bin/bash

cd ./artifacts/

for FILENAME in *.txt; do
    echo 'another line' >> "$FILENAME"
done