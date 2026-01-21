# System Health Monitor

A lightweight Bash script to monitor and report system health metrics on Linux systems.

## Overview

This script provides real-time monitoring of critical system resources including CPU usage, memory consumption, disk space, and system load. It's designed to help system administrators quickly identify performance bottlenecks and resource constraints.

## Features

- **CPU Monitoring**: Track CPU usage and load averages
- **Memory Analysis**: Monitor RAM and swap usage
- **Disk Space Tracking**: Check available disk space on all mounted filesystems
- **System Load**: Display system load averages
- **Process Monitoring**: Identify top resource-consuming processes
- **Lightweight**: Minimal dependencies, uses standard Linux utilities

## Prerequisites

- Linux-based operating system (Ubuntu, Debian, CentOS, RHEL, etc.)
- Bash shell (version 4.0 or higher recommended)
- Standard Linux utilities: `top`, `free`, `df`, `uptime`, `ps`

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Aditya-das-4707-e/system-health-monitor.git
cd system-health-monitor
```

2. Make the script executable:
```bash
chmod +x system_health.sh
```

## Usage

Run the script directly:
```bash
./system_health.sh
```

Or run with sudo for additional system information:
```bash
sudo ./system_health.sh
```

### Running Automatically

To schedule regular health checks, add a cron job:

```bash
# Edit crontab
crontab -e

# Add this line to run every hour
0 * * * * /path/to/system_health.sh >> /var/log/system_health.log 2>&1
```

## Output

The script provides a detailed report including:

- Current date and time
- System uptime
- CPU usage statistics
- Memory usage (total, used, free)
- Swap usage
- Disk space usage for all mounted filesystems
- System load averages (1, 5, and 15 minutes)
- Top processes by CPU and memory usage

## Configuration

You can customize the script by modifying the following variables at the top of `system_health.sh`:

- Thresholds for warnings (CPU, memory, disk)
- Number of top processes to display
- Output format and verbosity

## Troubleshooting

**Permission Denied**: Ensure the script has execute permissions (`chmod +x system_health.sh`)

**Command Not Found**: Verify that required utilities are installed on your system

**Incomplete Output**: Some metrics may require root privileges; run with `sudo`
