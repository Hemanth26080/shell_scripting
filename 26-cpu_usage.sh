#!/bin/bash
set -euo pipefail

CPU_THRESHOLD=80

echo "CPU Usage Alert Script Started"
echo "Threshold set to ${CPU_THRESHOLD}%"

CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d. -f1)
CPU_USAGE=$((100 - $CPU_IDLE))

echo "Current CPU Usage: ${CPU_USAGE}%"
