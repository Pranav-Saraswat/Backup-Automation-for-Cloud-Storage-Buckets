#!/bin/bash

# Load environment variables
source .env

# Remove backups older than 7 days
find $LOCAL_BACKUP_PATH -type d -mtime +7 -exec rm -rf {} \;

echo "Old backups cleaned up successfully!"
