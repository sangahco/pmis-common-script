#!/bin/sh

DATE=$(date +"%Y%m%d")

find . -name \*.log* -type f -mtime +7 | xargs tar -rf weekly_log_$DATE.tar
find . -name \*.log* -mtime +7 -exec rm {} \;
