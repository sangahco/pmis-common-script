#!/usr/bin/env bash

SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATE=$(date +"%Y%m%d")

cd "${SCRIPT_BASE_PATH}"
echo "Archiving logs in ${SCRIPT_BASE_PATH}..."
find . -name \*.log -type f -mtime +7 | xargs tar -rf weekly_log_$DATE.tar
find . -name \*.log -mtime +7 -exec rm {} \;