#!/bin/bash

# Define the target directory
target_dir="created-files"

# Change to the target directory
cd "$target_dir" || { echo "Failed to change to directory: $target_dir"; exit 1; }

# Get text as input
read -p "Enter search word: " keyword

# Find and remove all files with .log extension
find . -type f -name "*.log" -exec rm -f {} \;

# Remove every fifth file
counter=0
for file in test-*
do
  # Check if file does not have a  extension
  if [[ ! "$file" =~ \. ]]
  then
    ((counter++))
    if (( counter % 5 == 0 ))
    then
      rm -f "$file"
    fi
  fi
done

# Remove file with search word
for file in *.txt
do
  if grep -q "$keyword" "$file"
  then
    rm -f "$file"
  fi
done