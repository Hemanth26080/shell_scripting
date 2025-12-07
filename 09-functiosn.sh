#!/bin/bash

set -euo pipefail

# Automate the installation of multiple packages using a function

validation() {
USERID=$(id -u)
    if [ "$USERID" -ne 0 ]; then
        echo "This script must be run as root or with sudo."
        exit 6
    fi
}

install_pacakge() {
    local package_name=$1
    validation()
    echo "installing $package_name"
    dnf install "$package_name" -y
    if [ $? -ne 0 ]; then
        echo "$package_name installation failed."
        exit 5
    else
        echo "$package_name installed successfully."
    fi
}

pacakges_list=("mysql" "nginx" "python3" )
for pacakges_name in "${pacakges_list[@]}"; do
    install_pacakge "$pacakges_name"
done

