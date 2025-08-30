# Disk Space and Folder Size Checker

A collection of bash scripts for checking disk space and folder sizes on Ubuntu systems.
My test project.

## Features

### Disk Space Checker (`check_disk_space.sh`)
- Detects all physical discs using `lsblk`
- Displays filesystem usage and free space using `df`
- Generates a timestamped report file
- Shows information both on terminal and saves to file

### Folder Size Checker (`check_folder_size.sh`)
- Analyzes the size of a specific folder
- Shows total folder size and top 10 largest subdirectories
- Displays file and directory statistics
- Generates a timestamped report file

## Requirements

- Ubuntu Linux (or any Linux distribution with `lsblk` and `df` commands)
- Bash shell

## Usage

### Disk Space Checker
1. Make the script executable (if not already):
   ```bash
   chmod +x check_disk_space.sh
   ```
2. Run the script:
   ```bash
   ./check_disk_space.sh
   ```

### Folder Size Checker
1. Make the script executable (if not already):
   ```bash
   chmod +x check_folder_size.sh
   ```
2. Run the script with a folder path:
   ```bash
   ./check_folder_size.sh /path/to/folder
   ```
   Example:
   ```bash
   ./check_folder_size.sh /home/user/Documents
   ```

## Output

The script will:
- Display physical discs information
- Show filesystem usage with free space
- Print a summary of available space
- Save a report file named `disk_space_report_YYYYMMDD_HHMMSS.txt` in the same directory

## Example Output

```
Disk Space Report - Generated on 2025-08-30 11:44:47
==========================================

Physical Discs Detected:
NAME   SIZE TYPE VENDOR   MODEL
sda    500G disk ATA      Samsung SSD
nvme0n1 1T disk Samsung   NVMe SSD

Filesystem Usage (including free space):
Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/sda1      ext4   50G   20G   28G  42% /
/dev/nvme0n1p1 ext4  100G   30G   68G  31% /home

Free Space Summary:
Filesystem | Available Space | Use%
-----------|----------------|------
/dev/sda1   | 28G            | 42%
/dev/nvme0n1p1 | 68G       | 31%

Report saved to: disk_space_report_20250830_114447.txt
```

### Folder Size Checker Example Output

```
Folder Size Report - Generated on 2025-08-30 12:00:00
Folder: /home/user/Documents
==========================================

Total Folder Size:
15G	/home/user/Documents

Top 10 Largest Subdirectories:
Size | Path
-----|------
2.5G | /home/user/Documents/Photos
1.8G | /home/user/Documents/Videos
1.2G | /home/user/Documents/Projects
800M | /home/user/Documents/Downloads
500M | /home/user/Documents/Music

File Statistics:
Total files: 15432
Total directories: 234

Report saved to: folder_size_report_20250830_120000.txt
```

## Files

- `check_disk_space.sh` - Script to check all physical discs and free space
- `check_folder_size.sh` - Script to check size of a specific folder
- `.gitignore` - Git ignore file
- `disk_space_report_*.txt` - Generated disk space report files (ignored by git)
- `folder_size_report_*.txt` - Generated folder size report files (ignored by git)

## License

This project is open source. Feel free to use and modify as needed.
