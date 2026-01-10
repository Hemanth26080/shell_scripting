#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <n>"
    exit 1
fi

n=$1

# check if input is a number
if ! [[ "$N" =~ ^[0-9]+$ ]]; then 
    echo "Error: Please provide a valid number"
    exit 1
fi

a=0
b=1
echo "Fibonacci sequence up to $n terms:"
for (( i=0; i<n; i++ )); do
    echo -n "$a " # Print the current term
    fn=$((a + b)) # Calculate the next term
    a=$b    # Update a to the next term
    b=$fn  # Update b to the term after next
done