#!/bin/bash

set -euo pipefail

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Define environment variables
SOURCE_DIR="${SOURCE_DIR:-/var/log/shell-scripts}"
BACKUP_DIR="${BACKUP_DIR:-/var/log/shell-scripts/backup}"
RETENTION_DAYS="${RETENTION_DAYS:-15}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/logs_backup_$TIMESTAMP.zip"

# Function to check if directory exists
check_directory() {
    if [ ! -d "$1" ]; then
        echo -e "${R}ERROR: Directory $1 does not exist${N}" | tee -a "$LOG_FILE"
        return 1
    else
        echo -e "${G}INFO: Directory $1 found${N}" | tee -a "$LOG_FILE"
        return 0
    fi
}

# Verify source directory exists
if ! check_directory "$SOURCE_DIR"; then
    mkdir -p "$SOURCE_DIR"
    echo -e "${Y}WARNING: Created missing source directory $SOURCE_DIR${N}" | tee -a "$LOG_FILE"
fi

# Create and verify backup directory
if ! mkdir -p "$BACKUP_DIR"; then
    echo -e "${R}ERROR: Failed to create backup directory $BACKUP_DIR${N}" | tee -a "$LOG_FILE"
    exit 1
fi

if ! check_directory "$BACKUP_DIR"; then
    echo -e "${R}ERROR: Backup directory not accessible${N}" | tee -a "$LOG_FILE"
    exit 1
fi

echo "Script Execution started at: $(date)" | tee -a "$LOG_FILE"

# Backup and archive logs and delete files which are more than 15 days old
LOG_COUNT=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$RETENTION_DAYS" | wc -l)

if [ "$LOG_COUNT" -gt 0 ]; then
    echo -e "${G}INFO: Found $LOG_COUNT log files older than $RETENTION_DAYS days${N}" | tee -a "$LOG_FILE"
    
    # Create zip archive of old log files
    if find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$RETENTION_DAYS" | zip -q "$BACKUP_FILE" -@ 2>/dev/null; then
        echo -e "${G}SUCCESS: Backup created at $BACKUP_FILE${N}" | tee -a "$LOG_FILE"
        
        # Delete log files after successful backup
        find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$RETENTION_DAYS" -delete
        echo -e "${G}SUCCESS: Deleted $LOG_COUNT old log files${N}" | tee -a "$LOG_FILE"
    else
        echo -e "${R}ERROR: Failed to create backup archive${N}" | tee -a "$LOG_FILE"
        exit 1
    fi
else
    echo -e "${Y}INFO: No log files older than $RETENTION_DAYS days found${N}" | tee -a "$LOG_FILE"
fi

echo "Log backup and cleanup completed at: $(date)" | tee -a "$LOG_FILE"