#!/bin/bash
set -euo pipefail

CPU_THRESHOLD=5 # in project we keep it as 75

echo "CPU Usage Alert Script Started"
echo "Threshold set to ${CPU_THRESHOLD}%"

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)
CPU_USAGE=$((100 - $CPU_IDLE))

echo "Current CPU Usage: ${CPU_USAGE}%"
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "ALERT: CPU usage is HIGH (${CPU_USAGE}%)"
else
    echo "OK: CPU usage is under control (${CPU_USAGE}%)"
fi

