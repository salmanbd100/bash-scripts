#!/bin/bash



LOG_DIR="/home/salman/Documents/Me/bash-scripts/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
REPORT_FILE="/home/salman/Documents/Me/bash-scripts/logs/log_analysis_report.txt"

echo "Analysing log file ...." > $REPORT_FILE
echo "=======================" >> $REPORT_FILE

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

LOG_FILES=$(find $LOG_DIR -name "*.log")

echo -e "\nList of log files" >> $REPORT_FILE
echo $LOG_FILES >> $REPORT_FILE

for LOG_FILE in $LOG_FILES; do
    echo -e "\n" >> $REPORT_FILE
    echo "========================================" >> $REPORT_FILE
    echo "==$LOG_FILE==" >> $REPORT_FILE
    echo "========================================" >> $REPORT_FILE


    for PATTERN in ${ERROR_PATTERNS[@]}; do
        echo -e "\nsearching $PATTERN logs in $LOG_FILE file" >> $REPORT_FILE
        grep "$PATTERN" "$LOG_FILE" >> $REPORT_FILE

        echo -e "\nNumber of $PATTERN logs founds in $LOG_FILE" >> $REPORT_FILE

        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
        echo ERROR_COUNT >> $REPORT_FILE

        if [ $ERROR_COUNT -gt 10 ]; then
            echo "Action required: too many $PATTERN errors in this file $LOG_FILE"
        fi

    done

done

echo -e "\nLog analysis completed and report saved in: $REPORT_FILE"