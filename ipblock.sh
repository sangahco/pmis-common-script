#!/usr/bin/env sh

# create a file into /root folder named 'ip.blocked'
# put all the ip you want to block
# you can make a crontab schedule that is executed on every restart of the server like:
#
# @reboot <path to the script>/ipblock.sh

BLOCKDB="/root/ip.blocked"
IPS=$(grep -Ev "^#" $BLOCKDB)
for i in $IPS
do
iptables -A INPUT -s $i -j DROP
iptables -A OUTPUT -d $i -j DROP
done