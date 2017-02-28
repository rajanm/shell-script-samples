#!/bin/bash

unzip sensfile.zip

echo "start splitting csv file" $(date +%x_%r)

# split the csv file into separate files based on column no 1
awk -F"," '{print>$1}' sensfile.csv  

echo "completed splitting csv file" $(date +%x_%r)
