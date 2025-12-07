#!/bin/bash
set -euo pipefail

USERID=$(id -u )
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Create log directory and log file
mkdir -p /var/log/shellscripts
LOGFolder="/var/log/shellscripts"
SCRIPT_NAME=$( echo $0 | cut -d '.' -f1 ) # 11-logs
LOG_FILE="$LOGFolder"/"$SCRIPT_NAME".log # /var/log/shell-script/11-logs.log

echo "Script Execution started at: $(date)" &>> "$LOG_FILE" | tee -a "$LOG_FILE"

if [ $USERID -ne 0 ]; then
    echo -e "ERROR:: Please run this script with root privelege" | tee -a "$LOG_FILE"
    exit 1 # failure is other than 0
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "INSTALLING $2 ... $R FAILURE $N" | tee -a "$LOG_FILE"
        echo "Script Execution ended at: $(date)" &>> "$LOG_FILE"
        exit 6
    else
        echo -e "INSTALLING $2 ... $G SUCCESS $N" | tee -a "$LOG_FILE"
        echo "Script Execution ended at: $(date)" &>> "$LOG_FILE"
        exit 0
    fi
}

# Check and Install Mysql
dnf list installed mysql &>> "$LOG_FILE" | tee -a "$LOG_FILE"
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> "$LOG_FILE" | tee -a "$LOG_FILE"
    VALIDATE $? "Mysql"
else
    echo -e "Mysql already exits ... $Y SKIPPING $N" | tee -a "$LOG_FILE"
fi

# Check and Install Nginx
dnf list installed nginx &>> "$LOG_FILE" | tee -a "$LOG_FILE"
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> "$LOG_FILE" | tee -a "$LOG_FILE"
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exits ... $Y SKIPPING $N" | tee -a "$LOG_FILE"
fi

# Check and Install Python3
dnf list installed python3 &>> "$LOG_FILE" | tee -a "$LOG_FILE"
if [ $? -ne 0 ]; then
    dnf install python3 -y &>> "$LOG_FILE" | tee -a "$LOG_FILE"
    VALIDATE $? "Python3"
else
    echo -e "Python3 already exits ... $Y SKIPPING $N" | tee -a "$LOG_FILE"
fi
