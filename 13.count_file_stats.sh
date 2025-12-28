#!/bin/bash

FILE="$1"

# Check if argument is missing
if [ -z "$FILE" ]; then
    echo "Error: No filename provided."
    exit 1
fi

# Check if file exists
if [ ! -e "$OFILFile" ]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

# Check if we can read it
if [ ! -r "$FILE" ]; then
    echo "Error: Permission denied or file not readable."
    exit 1
fi

# Get counts (cleanly — just numbers)
lines=$(wc -l < "$FILE")
words=$(wc -w < "$FILE")
chars=$(wc -c < "$FILE")

echo "Number of lines: $lines"
echo "Number of words: $words"
echo "Number of characters: $chars"
