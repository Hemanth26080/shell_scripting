#!/bin/bash

set -euo pipefail

# This script demonstrates the use of various environment variables.
echo "All variables passed to the script: $@" 
echo "All variables passed to the script: $*"
echo "Script name: $0"
echo "Current directory: $PWD"
echo "Who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"
echo "Number of arguments passed to the script: $#"
echo "First argument: ${1:-No first argument provided}"


# Measure execution time in seconds of the script.

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in: $TOTAL_TIME Seconds"