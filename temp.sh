#!/usr/bin/env bash

set -e

SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${SCRIPT_BASE_PATH}"

SOURCE=$1
TARGET=$2

#find $SOURCE -mtime +360 -printf %P\\0 |\
#rsync --archive --compress --verbose --no-g --no-o --no-links --remove-source-files --files-from=- --from0 $SOURCE $TARGET


while read LINE
do

SOURCE_DIR=${SOURCE}/${LINE}

echo "${SOURCE_DIR}"
mv ${SOURCE_DIR} ${TARGET} && \
ln -s ${TARGET}/${LINE} ${SOURCE_DIR}

done < edmstomove.txt