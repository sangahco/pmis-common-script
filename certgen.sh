#!/usr/bin/env bash

# this script have to be used together with certbot script docker17-auto.sh
# you don't need this if you are using normal docker-auto.sh

export CERTBOT_CERTS_PATH=/etc/letsencrypt
export CERTBOT_WEBROOT=$1
export CERTBOT_HOST=$2

/root/nginx-certbot/docker17-auto.sh up
