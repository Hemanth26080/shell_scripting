#!/bin/bash
set -euo pipefail

echo "Enter a number:"
read num

if (( $num % 2 == 0 )); then
    echo "$num is even number."
else
    echo "$num is odd number."
fi

#creating basic calculator using nested if statements
echo "Welcome to the basic calculator!"
echo "Enter first number:"
read num1
echo "Enter second number:"
read num2
echo "Choose an operation: +, -, *, /"
read operation
if [[ $operation == "+" ]]; then
    result=$((num1 + num2))
elif [[ $operation == "-" ]]; then
    result=$((num1 - num2))
elif [[ $operation == "*" ]]; then
    result=$((num1 * num2))
elif [[ $operation == "/" ]]; then
    if (( num2 == 0 )); then
        echo "Error: Division by zero is not allowed."
        exit 1
    fi
    result=$((num1 / num2))
else
    echo "Invalid operation selected."
    exit 1
fi
echo "The result of $num1 $operation $num2 is: $result"