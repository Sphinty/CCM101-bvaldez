#!/bin/bash
# ==============================================================================
# CloudNova Enterprise Infrastructure - Automated Disaster Recovery Script
# Target: MySQL Database Container (cloudnova-db)
# ==============================================================================

BACKUP_DIR="/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILENAME="cloudnova_db_backup_${TIMESTAMP}.sql.gz"
LOG_FILE="/var/log/cloudnova_backup.log"
CONTAINER_NAME="cloudnova-db"
DB_NAME="wordpress_db"
DB_USER="root"
DB_PASS="RootSuperSecurePassword2026!"

mkdir -p "${BACKUP_DIR}"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting automated database backup..." | sudo tee -a "${LOG_FILE}"

# Extract database dump from container and stream into gzip
docker exec "${CONTAINER_NAME}" /usr/bin/mysqldump -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" 2>/dev/null | gzip > "${BACKUP_DIR}/${BACKUP_FILENAME}"

if [ $? -eq 0 ] && [ -s "${BACKUP_DIR}/${BACKUP_FILENAME}" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS: Backup created at ${BACKUP_DIR}/${BACKUP_FILENAME}" | sudo tee -a "${LOG_FILE}"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup Size: $(du -h ${BACKUP_DIR}/${BACKUP_FILENAME} | awk '{print $1}')" | sudo tee -a "${LOG_FILE}"
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: Backup operation failed!" | sudo tee -a "${LOG_FILE}"
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Cleaning up archives older than 7 days..." | sudo tee -a "${LOG_FILE}"
find "${BACKUP_DIR}" -type f -name "cloudnova_db_backup_*.sql.gz" -mtime +7 -exec rm -f {} \;

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Disaster recovery routine completed." | sudo tee -a "${LOG_FILE}"
exit 0
