#!/bin/bash

set -euo pipefail

# This script tests the input handling of a form script.

#just first name,last name,email,password read from user and print submit success message.
read -p "Enter your first name: " first_name
read -p "Enter your last name: " last_name
read -p "Enter your email: " email
read -sp "Enter your password: " password
echo

echo "Form submitted successfully!"
echo "First Name: $first_name"
echo "Last Name: $last_name"
echo "Email: $email"