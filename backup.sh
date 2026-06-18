#!/bin/bash
SOURCE_DIR="$HOME/devops_project/data"
BACKUP_DIR="$HOME/devops_project/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
echo "[$(date)] Backup completed: $BACKUP_FILE" >> backup.log
