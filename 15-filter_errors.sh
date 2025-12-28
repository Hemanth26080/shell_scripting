#!/bin/bash

set -euo pipefail

# Script to filter lines containing "ERROR" from a log file
file_name=$1
Output_file="errors_filtered.log"

if [ ! -f "$file_name" ]; then
    echo "Error: File '$file_name' not found!"
    exit 1
fi

echo "=== ERROR LOG ===" > "$Output_file"

# Read the file line by line and filter "ERROR" lines
while IFS= read -r line; do
    if [[ "$line" == *"ERROR"* ]]; then
        echo "$line" >> "$Output_file"
    fi
done <<< "$file_name"
echo "Filtered errors have been saved to '$Output_file'."


#Quick alternative using grep:

# grep "ERROR" "$file_name" > temp_errors
# echo "=== ERROR LOG ===" > "$Output_file"
# cat temp_errors >> "$Output_file"