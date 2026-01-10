#!/bin/bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <string>"
    exit 1
fi
input_string="$1"
length=${#input_string}
reversed_string=""
for (( i=length-1; i>=0; i-- )); do
    reversed_string+=${input_string:i:1}
done
if [ "$input_string" == "$reversed_string" ]; then
    echo "\"$input_string\" is a palindrome."
else
    echo "\"$input_string\" is not a palindrome."
fi
