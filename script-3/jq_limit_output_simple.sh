#!/bin/bash

# Define input and output file paths
input_file="/tmp/script-3/inputs/inputs.json"
output_file="/tmp/script-3/outputs/simple.json"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file $input_file does not exist."
  exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$(dirname "$output_file")"

# Parse the JSON data using jq
jq '[
  .[:3] |
  map({
    name: .name,
    age: .age,
    address: .address,
    email: .email
  })
]' "$input_file" > "$output_file"

echo "Parsed data has been saved to $output_file"