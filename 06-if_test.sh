#!/bin/bash
set -euo pipefail

echo "Enter a number:"
read num

if (( $num % 2 == 0 )); then
    echo "$num is even number."
else
    echo "$num is odd number."
fi

