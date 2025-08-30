#!/bin/bash

# Script to check the volume/size of a specific folder
# Usage: ./check_folder_size.sh <folder_path>

# Check if folder path is provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a folder path as an argument."
    echo "Usage: $0 <folder_path>"
    exit 1
fi

FOLDER_PATH="$1"

# Check if the path exists
if [ ! -e "$FOLDER_PATH" ]; then
    echo "Error: Path '$FOLDER_PATH' does not exist."
    exit 1
fi

# Check if it's a directory
if [ ! -d "$FOLDER_PATH" ]; then
    echo "Error: '$FOLDER_PATH' is not a directory."
    exit 1
fi

# Get current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Generate report filename with timestamp
REPORT_FILE="folder_size_report_$(date +%Y%m%d_%H%M%S).txt"

# Create report header
echo "Folder Size Report - Generated on $DATE" > "$REPORT_FILE"
echo "Folder: $FOLDER_PATH" >> "$REPORT_FILE"
echo "==========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Get total size of the folder
echo "Total Folder Size:" >> "$REPORT_FILE"
du -sh "$FOLDER_PATH" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Get sizes of subdirectories (top 10 largest)
echo "Top 10 Largest Subdirectories:" >> "$REPORT_FILE"
echo "Size | Path" >> "$REPORT_FILE"
echo "-----|------" >> "$REPORT_FILE"
du -h "$FOLDER_PATH"/* 2>/dev/null | sort -hr | head -10 | while read -r size path; do
    printf "%-4s | %s\n" "$size" "$path" >> "$REPORT_FILE"
done
echo "" >> "$REPORT_FILE"

# Get file count
echo "File Statistics:" >> "$REPORT_FILE"
TOTAL_FILES=$(find "$FOLDER_PATH" -type f | wc -l)
TOTAL_DIRS=$(find "$FOLDER_PATH" -type d | wc -l)
echo "Total files: $TOTAL_FILES" >> "$REPORT_FILE"
echo "Total directories: $TOTAL_DIRS" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Report saved to: $REPORT_FILE"

# Also display on screen
echo "Folder Size Report - Generated on $DATE"
echo "Folder: $FOLDER_PATH"
echo "=========================================="
echo ""
echo "Total Folder Size:"
du -sh "$FOLDER_PATH"
echo ""
echo "Top 10 Largest Subdirectories:"
echo "Size | Path"
echo "-----|------"
du -h "$FOLDER_PATH"/* 2>/dev/null | sort -hr | head -10 | while read -r size path; do
    printf "%-4s | %s\n" "$size" "$path"
done
echo ""
echo "File Statistics:"
echo "Total files: $TOTAL_FILES"
echo "Total directories: $TOTAL_DIRS"
echo ""
echo "Report saved to: $REPORT_FILE"
