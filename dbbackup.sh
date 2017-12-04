#!/bin/sh

# Add the following lines to crontab ( to edit crontab use the command: crontab -e )
# Change BASH_ENV to the .bashrc file with environment variables to set before the cron jobs start
#
# SHELL=/bin/bash
# BASH_ENV=/home/oracle/.bashrc
# 05 12 * * * sh /home/sangah/script/dbbackup.sh

echo Starting DB backup...
sh /home/sangah/script/dbdump.sh AL32UTF8 YRP
sh /home/sangah/script/dbdump.sh AL32UTF8 LCT
sh /home/sangah/script/dbdump.sh AL32UTF8 DSP
sh /home/sangah/script/dbdump.sh AL32UTF8 DHG
sh /home/sangah/script/dbdump.sh AL32UTF8 SPT020
sh /home/sangah/script/dbdump.sh AL32UTF8 RWJEJU
sh /home/sangah/script/dbdump.sh AL32UTF8 CCE
sh /home/sangah/script/dbdump.sh AL32UTF8 IBS1
sh /home/sangah/script/dbdump.sh AL32UTF8 PCITY
sh /home/sangah/script/dbdump.sh AL32UTF8 RWJJ