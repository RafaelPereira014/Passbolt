#!/bin/bash

# Backup directory
BACKUP_DIR="YOUR_DIR"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP"

# Passbolt database credentials
DB_CONTAINER="YOUR-CONTAINER"
DB_USER="YOUR-USER"
DB_PASSWORD="YOUR-PASS"
DB_NAME="DB_NAME"

# Passbolt server keys location (inside the container)
PASSBOLT_CONTAINER="YOUR-CONTAINER"
SERVER_KEYS_PATH="/var/www/passbolt/config/gpg"

# Create backup directory
mkdir -p "$BACKUP_PATH"

# Dump database
echo "Backing up database..."
docker exec "$DB_CONTAINER" sh -c "mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME" > "$BACKUP_PATH/passbolt_db.sql"

# Copy server keys
echo "Backing up server keys..."
docker cp "$PASSBOLT_CONTAINER:$SERVER_KEYS_PATH" "$BACKUP_PATH/server_keys"

# Confirm completion
echo "Backup completed: $BACKUP_PATH"
