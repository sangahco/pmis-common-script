#!/bin/sh

set -e

/usr/bin/aws s3 sync \
--storage-class GLACIER \
--exclude "archive/*" \
--exclude "*.zip" \
--exclude "*.rar" \
--exclude "*.7z" \
--exclude "*.000" \
/data/nfsshare/edms s3://sangah-edms