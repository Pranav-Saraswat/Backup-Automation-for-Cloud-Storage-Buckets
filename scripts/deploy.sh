#!/bin/bash

# Load environment variables
source .env

# Timestamp for backup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$LOCAL_BACKUP_PATH/backup_$TIMESTAMP"

# Create backup directory
mkdir -p $BACKUP_DIR

# Compress backup files
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" -C $LOCAL_BACKUP_PATH .

# AWS S3 Backup
aws s3 cp "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" s3://$AWS_S3_BUCKET_NAME/ --storage-class STANDARD_IA

# GCP Cloud Storage Backup
gsutil cp "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" gs://$GCP_BUCKET_NAME/

# Verify Uploads
aws s3 ls s3://$AWS_S3_BUCKET_NAME/ | grep "backup_$TIMESTAMP.tar.gz" && echo "AWS Backup Verified!"
gsutil ls gs://$GCP_BUCKET_NAME/ | grep "backup_$TIMESTAMP.tar.gz" && echo "GCP Backup Verified!"

# Send Notification (Optional)
if [ -n "$SLACK_WEBHOOK_URL" ]; then
    curl -X POST -H 'Content-type: application/json' --data '{"text":"Backup completed successfully at '$TIMESTAMP'"}' $SLACK_WEBHOOK_URL
fi

echo "Backup process completed successfully!"
