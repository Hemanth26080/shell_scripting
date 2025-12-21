#!/bin/bash

#set -euo pipefail

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Create log directory and log file

LOGFolder="/var/log/shell-scripts"
SCRIPT_NAME=$( echo $0 | cut -d '.' -f1 )
LOG_FILE="$LOGFolder/$SCRIPT_NAME.log"

mkdir -p $LOGFolder
echo "Script Execution started at: $(date)" | tee -a "$LOG_FILE"

#checck for root user
if [ $USERID -ne 0 ]; then
    echo -e "ERROR:: Please run this script with root privelege" | tee -a "$LOG_FILE"
    exit 1
fi

# Function to validate installation status

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "INSTALLING $2 ... $R FAILURE $N" | tee -a "$LOG_FILE"
        echo "Script Execution ended at: $(date)" &>> "$LOG_FILE"
        exit 1
    else
        echo -e "INSTALLING $2 ... $G SUCCESS $N" | tee -a "$LOG_FILE"
        echo "Script Execution ended at: $(date)" &>> "$LOG_FILE"
    fi
}

# Loop to install packages

for package in $@
do 
    #check if package is already installed
    dnf list installed $package &>> "$LOG_FILE"
    if [ $? -ne 0 ]; then 
        dnf install $package -y &>> "$LOG_FILE"
        VALIDATE $? "$package"
    else
        echo -e "$package already exists ... $Y SKIPPING $N" | tee -a "$LOG_FILE"
    fi
done
