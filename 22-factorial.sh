#!/bin/bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

N="$1"

# Check if input is a non-negative integer
if ! [[ "$N" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a non-negative integer."
    exit 1
fi

if [ "$N" -eq 0 ] || [ "$N" -eq 1 ]; then
    echo "Factorial of $N is 1"
    exit 0
fi

factorial=1
for (( i=2; i<=N; i++ )); do
    factorial=$((factorial * i))
done    
echo "Factorial of $N is $factorial"