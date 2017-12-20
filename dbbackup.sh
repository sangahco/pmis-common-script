#!/bin/sh

# Add the following lines to crontab ( to edit crontab use the command: crontab -e )
# Change BASH_ENV to the .bashrc file with environment variables to set before the cron jobs start
#
# SHELL=/bin/bash
# BASH_ENV=/home/oracle/.bashrc
# 05 12 * * * sh /home/sangah/script/dbbackup.sh

set -e

SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $SCRIPT_BASE_PATH

echo Starting DB backup...
sh dbdump.sh AL32UTF8 TEST