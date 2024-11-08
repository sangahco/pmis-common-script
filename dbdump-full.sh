#!/bin/sh

export ORACLE_HOME=${ORACLE_HOME:-/u01/app/oracle/product/11.2.0/dbhome_1}
export ORACLE_SCHEMA=FULL
export ORACLE_SID=$1

SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
EXPORT_FOLDER=/home/sangah/dbdump
ORACLE_DUMP_DIRECTORY=DATA_PUMP_DIR
DATE=$(date +"%Y%m%d_%H%M")

echo -ne '\n' | $ORACLE_HOME/bin/expdp \"/ as sysdba\" \
directory=$ORACLE_DUMP_DIRECTORY \
dumpfile=$DATE-${ORACLE_SCHEMA}_export.dmp \
logfile=$DATE-${ORACLE_SCHEMA}_export.log \
FULL=YES
# consistent=y this option can cause error ORA-00922

echo "Export folder: $EXPORT_FOLDER"
echo "Oracle user: $ORACLE_USER"
echo "Oracle dump directory: $ORACLE_DUMP_DIRECTORY"
echo "Oracle schema: $ORACLE_SCHEMA"
echo "Oracle SID: $ORACLE_SID"
echo "Oracle home: $ORACLE_HOME"
echo "-----------------------------------------"

cd $EXPORT_FOLDER
# c = create
# j = bzip2 compression
tar cjf $DATE-${ORACLE_SCHEMA}_export.tar.bz2 \
$DATE-${ORACLE_SCHEMA}_export.dmp \
$DATE-${ORACLE_SCHEMA}_export.log

rm $EXPORT_FOLDER/$DATE-${ORACLE_SCHEMA}_export.dmp $EXPORT_FOLDER/$DATE-${ORACLE_SCHEMA}_export.log

find $EXPORT_FOLDER/*${ORACLE_SCHEMA}_export.tar.bz2 -mtime +180 -delete

cd $SCRIPT_BASE_PATH
$ORACLE_HOME/bin/rman target / nocatalog @delete-archivelog.rmn log=delete-arch.log
#$RMAN_SCRIPT_FOLDER/rmanexec.sh