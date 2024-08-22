#!/bin/bash

# Define input and output file paths
input_file="/tmp/script-3/inputs/inputs.json"
output_file="/tmp/script-3/outputs/loop.json"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file $input_file does not exist."
  exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$(dirname "$output_file")"

# Initialize variables
object_counter=0
inside_object=false
name=""
age=""
address=""
email=""

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
      ((object_counter++))

      # Check if the object counter is within the desired range (3 to 5)
      if ((object_counter >= 3 && object_counter <= 5)); then
        # Print the extracted fields
        echo "Name: $name"
        echo "Age: $age"
        echo "Address: $address"
        echo "Email: $email"
        echo "---------------------"
      fi

      # Clear the variables for the next object
      name=""
      age=""
      address=""
      email=""
    fi

    # Only extract fields if we're inside a valid object
    if $inside_object; then
      if [[ "$line" =~ "\"name\"" ]]; then
        name=$(echo "$line" | sed 's/.*"name": "\([^"]*\)".*/\1/')
      elif [[ "$line" =~ "\"age\"" ]]; then
        age=$(echo "$line" | sed 's/.*"age": \([0-9]*\).*/\1/')
      elif [[ "$line" =~ "\"address\"" ]]; then
        address=$(echo "$line" | sed 's/.*"address": "\([^"]*\)".*/\1/')
      elif [[ "$line" =~ "\"email\"" ]]; then
        email=$(echo "$line" | sed 's/.*"email": "\([^"]*\)".*/\1/')
      fi
    fi
  done < "$input_file"
} > "$output_file"