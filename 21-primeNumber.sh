#!/bin/bash

set -euo pipefail

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi
input_number="$1"
# check if input is a number
if ! [[ "$input_number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number"
    exit 1
fi

# numbers less than or equal to 1 are not prime
if [ "$input_number" -le 1 ]; then
    echo "$input_number is NOT a prime number"
    exit 0
fi

# Check for primality by testing divisors up to sqrt(n)
for (( i=2; i*i<=input_number; i++ )); do
    if [ $((input_number % i)) -eq 0 ]; then
        echo "$input_number is NOT a prime number"
        exit 0
    fi
done

echo "$input_number is a prime number"