#!/bin/bash

# This script is used in conjunction with oracle db docker version
# https://github.com/sangahco/docker-oracle12c

set -e

export ORACLE_SCHEMA=$1

EXPORT_FOLDER=/home/oracle/.oracle-data/admin/xe/dpdump
ORACLE_USER=system
ORACLE_PASSWORD=oracle
ORACLE_DUMP_DIRECTORY=DATA_PUMP_DIR
DATE=$(date +"%Y%m%d_%H%M")

docker exec oracle12c expdp $ORACLE_USER/$ORACLE_PASSWORD \
directory=$ORACLE_DUMP_DIRECTORY schemas=${ORACLE_SCHEMA} \
dumpfile=$DATE-${ORACLE_SCHEMA}_export.dmp \
logfile=$DATE-${ORACLE_SCHEMA}_export.log content=ALL status=30
# consistent=y this option can cause error ORA-00922

echo "Export folder: $EXPORT_FOLDER"
echo "Oracle user: $ORACLE_USER"
echo "Oracle dump directory: $ORACLE_DUMP_DIRECTORY"
echo "-----------------------------------------"

cd $EXPORT_FOLDER
tar cjf $DATE-${ORACLE_SCHEMA}_export.tar.bz2 \
$DATE-${ORACLE_SCHEMA}_export.dmp \
$DATE-${ORACLE_SCHEMA}_export.log

rm $EXPORT_FOLDER/$DATE-${ORACLE_SCHEMA}_export.dmp $EXPORT_FOLDER/$DATE-${ORACLE_SCHEMA}_export.log

#find $EXPORT_FOLDER/*${ORACLE_SCHEMA}_export.tar.bz2 -mtime +30 -delete
