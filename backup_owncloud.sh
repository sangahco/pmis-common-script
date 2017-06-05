#!/usr/bin/env sh

CLOUD_HOME=/home/cloud
CLOUD_BACKUP_HOME="${CLOUD_BACKUP_HOME:-/media/owncloud}"
CLOUD_BACKUP_PREFIX=owncloud-sqlbkp_
SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $SCRIPT_BASE_PATH

#sqlite3 /home/cloud/data/owncloud.db .dump > owncloud-dbbackup_`date +"%Y%m%d"`.bak
mysqldump --lock-tables --host 127.0.0.1 \
--port 3306 --user oc_admin \
-pmqm87x6c8ckz3fcinspmeqbumkhaxh \
owncloud > "$CLOUD_BACKUP_HOME"/owncloud-sqlbkp_`date +"%Y%m%d"`.bak

rsync -Aaxv "$CLOUD_HOME" "$CLOUD_BACKUP_HOME"


echo "Removing backup older than 15 days..."
find $CLOUD_BACKUP_HOME/$CLOUD_BACKUP_PREFIX*.bak -mtime +15 -delete

echo "Script terminated"