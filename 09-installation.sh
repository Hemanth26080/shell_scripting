#!/bin/bash

set -euo pipefail

# Automated Installation of pacakges

USERID=$(id -u)
if [ "$USERID" -ne 0 ]; then
    echo "THis script must be run as root or with sudo."
    exit 6
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "MySQL Installation failure."
    exit 5
else
    echo "MySQL installed successfully."
fi