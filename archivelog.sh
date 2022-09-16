#!/usr/bin/env bash

SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATE=$(date +"%Y%m%d")

cd "${SCRIPT_BASE_PATH}"
echo "Archiving logs in ${SCRIPT_BASE_PATH}..."
find ./$3 -name "$1" -type f -mtime +7 | xargs tar --bzip2 --create -f weekly_$2_log_$DATE.tar.bz2
find ./$3 -name "$1" -mtime +7 -exec rm {} \;
