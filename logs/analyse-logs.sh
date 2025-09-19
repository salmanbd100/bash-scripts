#!/bin/bash

# Log Analysis Script
# This script analyzes log files for error patterns and generates a comprehensive report

# Configuration variables - define paths and file names
LOG_DIR="/Users/salmanrahman/Documents/My-Project/bash-scripts/logs"  # Directory containing log files
APP_LOG_FILE="application.log"  # Application log file name
SYS_LOG_FILE="system.log"       # System log file name
REPORT_FILE="/Users/salmanrahman/Documents/My-Project/bash-scripts/logs/log_analysis_report.txt"  # Output report file

# Initialize the report file with header information
echo "Analysing log file ...." > "$REPORT_FILE"  # Create/overwrite report file
echo "=======================" >> "$REPORT_FILE"  # Add separator line

# Define array of error patterns to search for in log files
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

# Find all .log files in the specified directory
LOG_FILES=$(find "$LOG_DIR" -name "*.log")

# Write list of found log files to the report
echo -e "\nList of log files" >> "$REPORT_FILE"
echo "$LOG_FILES" >> "$REPORT_FILE"

# Process each log file found
for LOG_FILE in $LOG_FILES; do
    # Add section header for current log file
    echo -e "\n" >> "$REPORT_FILE"
    echo "========================================" >> "$REPORT_FILE"
    echo "==$LOG_FILE==" >> "$REPORT_FILE"
    echo "========================================" >> "$REPORT_FILE"

    # Search for each error pattern in the current log file
    for PATTERN in ${ERROR_PATTERNS[@]}; do
        # Document what pattern we're searching for
        echo -e "\nsearching $PATTERN logs in $LOG_FILE file" >> "$REPORT_FILE"

        # Extract and write all lines containing the current pattern
        grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        # Count and report the number of occurrences
        echo -e "\nNumber of $PATTERN logs founds in $LOG_FILE" >> "$REPORT_FILE"
        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")  # Count pattern occurrences
        echo "$ERROR_COUNT" >> "$REPORT_FILE"

        # Alert if error count exceeds threshold (10 errors)
        if [ "$ERROR_COUNT" -gt 10 ]; then
            echo "Action required: too many $PATTERN errors in this file $LOG_FILE"
        fi

    done

done

# Final message indicating completion
echo -e "\nLog analysis completed and report saved in: $REPORT_FILE"