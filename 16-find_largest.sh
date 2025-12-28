#!/bin/bash

set -euo pipefail

number=$0
max=0

for i in "$@"
    if [ "$i" -gt "$max" ]; then
        max=$i
    fi
done
echo "The largest number is: $max"