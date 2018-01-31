#!/usr/bin/env bash

# this script have to be used together with certbot service (https://github.com/sangahco/nginx-certbot)
# AUTOSCRIPT can be changed to docker17-auto.sh if using old Centos 6.x

AUTOSCRIPT=docker-auto.sh

export CERTBOT_CERTS_PATH=/etc/letsencrypt
export CERTBOT_WEBROOT=$1
export CERTBOT_HOST=$2

/root/nginx-certbot/$AUTOSCRIPT up
