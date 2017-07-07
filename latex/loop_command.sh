#!/bin/bash

# Useful function to repeat the same command for each line of a given file
# Params : input_file, command 

args="$@"
nshifts=$(($# -1))

for i in `seq 1 $nshifts`;
do
    cmd+="$1 "
    shift 
done
file="$1"
while IFS='' read -r package || [[ -n "$package" ]]; do
    $cmd $package
done < "$file"


