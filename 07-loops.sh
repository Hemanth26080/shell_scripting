#!/bin/bash

set -euo pipefail

# Loops for iterating over a list of items
for item in apple banana cherry; do
    echo "I like $item"
done

# Looping through command-line arguments
echo "Command-line arguments:"
for arg in "$@"; do
    echo "$arg"
done

# Using a while loop with a counter
count=1
while [ $count -le 5 ]; do
    echo "Count is: $count"
    ((count++))
done

# Looping through files in a directory
echo "Files in current directory:"
for file in *; do
    if [ -f "$file" ]; then
        echo "$file"
    fi
done

# Loops for install packages
packages=("git" "curl" "vim")
for pkg in "${packages[@]}"; do
    echo "Installing package: $pkg"
    sudo apt-get install -y "$pkg"
done

# Looping through lines in a file
echo "Reading lines from sample.txt:"
while IFS= read -r line; do
    echo "$line"
done < sample.txt

