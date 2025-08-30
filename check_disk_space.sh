#!/bin/bash

# Script to check all physical discs on Ubuntu and report free space
# Saves report to a file in the same folder

# Get current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Generate report filename with timestamp
REPORT_FILE="disk_space_report_$(date +%Y%m%d_%H%M%S).txt"

# Create report header
echo "Disk Space Report - Generated on $DATE" > "$REPORT_FILE"
echo "==========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# List all physical discs
echo "Physical Discs Detected:" >> "$REPORT_FILE"
lsblk -d -o NAME,SIZE,TYPE,VENDOR,MODEL | grep disk >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Get disk usage information
echo "Filesystem Usage (including free space):" >> "$REPORT_FILE"
df -h --output=source,fstype,size,used,avail,pcent,target >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Summary of free space
echo "Free Space Summary:" >> "$REPORT_FILE"
echo "Filesystem | Available Space | Use%" >> "$REPORT_FILE"
echo "-----------|----------------|------" >> "$REPORT_FILE"
df -h --output=source,avail,pcent | tail -n +2 | while read -r fs avail use; do
    printf "%-10s | %-14s | %s\n" "$fs" "$avail" "$use" >> "$REPORT_FILE"
done

echo "" >> "$REPORT_FILE"
echo "Report saved to: $REPORT_FILE"

# Also display the report on screen
echo "Disk Space Report - Generated on $DATE"
echo "=========================================="
echo ""
echo "Physical Discs Detected:"
lsblk -d -o NAME,SIZE,TYPE,VENDOR,MODEL | grep disk
echo ""
echo "Filesystem Usage (including free space):"
df -h --output=source,fstype,size,used,avail,pcent,target
echo ""
echo "Free Space Summary:"
echo "Filesystem | Available Space | Use%"
echo "-----------|----------------|------"
df -h --output=source,avail,pcent | tail -n +2 | while read -r fs avail use; do
    printf "%-10s | %-14s | %s\n" "$fs" "$avail" "$use"
done

echo ""
echo "Report saved to: $REPORT_FILE"
