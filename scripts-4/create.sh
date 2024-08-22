#!/bin/bash

# Define file count
num_files=20

# Create new folder
mkdir -p created-files

for ((i=1; i<=num_files; i++))
do
  # Create files
  touch "created-files/test-${i}.txt"
  touch "created-files/test-${i}.log"
  touch "created-files/test-${i}"

  # Populate .txt file
  echo "This is a random text file test-${i}.txt" > "created-files/test-${i}.txt"
done