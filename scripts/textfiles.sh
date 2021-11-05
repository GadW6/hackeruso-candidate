#!/bin/bash

mkdir artifacts
cd ./artifacts/
touch sample{01..10}.txt

for FILENAME in *.txt; do
    echo 'Some default content' > "$FILENAME"
done