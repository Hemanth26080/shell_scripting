#!/bin/bash

set -euo pipefail

DIR="${1:-.}"  # Use given directory, or current folder if not provided

if [ ! -d "$DIR" ]; then
    echo "Error: '$DIR' is not a valid directory."
    exit 1
fi

# -i.bak means: change the file, but save a backup as filename.conf.bak
find "$DIR" -name "*.conf" -type f -exec sed -i.bak 's/[Ff][Oo][Oo]/BAR/g' {} +

length=$(find "$DIR" -name "*.conf" -type f -exec sed -i.bak 's/[Ff][Oo][Oo]/BAR/g' {} + | wc -l)

echo "Replaced 'foo' with 'BAR' in $length .conf files in directory '$DIR'."
