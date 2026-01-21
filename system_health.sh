#!/bin/bash

# Log file 
LOG_FILE="/var/log/system_health.log"

# Threshold values meaningful for alerts
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
PROCESS_THRESHOLD=300

# Get CPU usage
CPU_USAGE=$(top -bn1 | awk '/Cpu/ {printf "%.0f", 100-$8}')

# Get Memory usage
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

# Get Disk usage (root partition)
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Get running process count
PROCESS_COUNT=$(ps aux | wc -l)

# Function to log alerts
log_alert() {
    echo "$(date): $1" | tee -a "$LOG_FILE"
}

# Check CPU use
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    log_alert "ALERT: CPU usage is high - ${CPU_USAGE}%"
fi

# Check Memory use
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
    log_alert "ALERT: Memory usage is high - ${MEM_USAGE}%"
fi

# Check Disk use 
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    log_alert "ALERT: Disk usage is high - ${DISK_USAGE}%"
fi

# Check Processes use
if [ "$PROCESS_COUNT" -gt "$PROCESS_THRESHOLD" ]; then
    log_alert "ALERT: Too many running processes - ${PROCESS_COUNT}"
fi
