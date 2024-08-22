#!/bin/bash

# Define input and output file paths
input_file="/tmp/script-3/inputs/inputs.json"
output_file="/tmp/script-3/outputs/condition.json"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file $input_file does not exist."
  exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$(dirname "$output_file")"

# Initialize variables
inside_object=false
name=""
filter_letter="F"

# Extract fields and print them
{
  # Read the JSON file line by line
  while IFS= read -r line; do
    # Detect the start of a new JSON object
    if [[ "$line" =~ "{" ]]; then
      inside_object=true
      continue
    fi

    # Detect the end of a JSON object
    if [[ "$line" =~ "}" && $inside_object == true ]]; then
      inside_object=false

      # Check if the letters match
      if [[ "${name:0:1}" == "$filter_letter" ]]; then
        # Print the extracted fields
        echo "Name: $name"
        echo "---------------------"
      fi

      # Clear the variables for the next object
      name=""
      continue
    fi

    # Only extract fields if we're inside a valid object
    if $inside_object; then
      if [[ "$line" =~ "\"name\"" ]]; then
        name=$(echo "$line" | sed 's/.*"name": "\([^"]*\)".*/\1/')
      fi
    fi
  done < "$input_file"
} > "$output_file"