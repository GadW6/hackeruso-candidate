#!/bin/bash

IS_FOLDER_EXISTS=$1

if $IS_FOLDER_EXISTS 
    then rm -r ./artifacts/*
fi

mkdir artifacts
cd ./artifacts/
touch sample{01..10}.txt

for FILENAME in *.txt; do
    echo 'Some default content' > "$FILENAME"
done