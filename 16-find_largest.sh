#!/bin/bash

set -euo pipefail

# Check if any numbers were given
if [ $# -eq 0 ]; then
    echo "Error: Please provide at least one number."
    exit 1
fi

# Start with the first number as the max
max="$1"

# Check the rest
for num in "$@"; do
    if [ "$num" -gt "$max" ]; then
        max="$num"
    fi
done

echo "The largest number is: $max"