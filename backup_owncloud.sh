#!/usr/bin/env bash

set -e

OWNCLOUD_DATA="${OWNCLOUD_DATA:-/home/cloud/data}"
CLOUD_BACKUP_HOME="${CLOUD_BACKUP_HOME:-/media/owncloud}"
CLOUD_BACKUP_PREFIX=owncloud-sqlbkp_
DATE=$(date +"%Y%m%d_%H%M")
SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $SCRIPT_BASE_PATH

# 1. DB BACKUP

#export MYSQL_ROOT_PASSWORD=xxxxx
sudo -u sangah \
MYSQL_DUMP_DIR=$CLOUD_BACKUP_HOME \
MYSQL_DUMP_FILE=owncloud-sqlbkp_$DATE.bak \
/home/docker/dev-machine/docker-auto.sh --with-hub -f docker-compose-mysql-dump.yml up -d

#sqlite3 /home/cloud/data/owncloud.db .dump > owncloud-dbbackup_`date +"%Y%m%d"`.bak
#mysqldump --lock-tables --host 127.0.0.1 \
#--port 3306 --user oc_admin \
#-pmqm87x6c8ckz3fcinspmeqbumkhaxh \
#owncloud > "$CLOUD_BACKUP_HOME"/owncloud-sqlbkp_`date +"%Y%m%d"`.bak


# 2. DATA BACKUP
rsync -Av --archive --delete --whole-file --no-g --no-o "$OWNCLOUD_DATA" "$CLOUD_BACKUP_HOME"


echo "Removing backup older than 15 days..."
find $CLOUD_BACKUP_HOME/$CLOUD_BACKUP_PREFIX*.bak -mtime +7 -delete

echo "Script terminated"