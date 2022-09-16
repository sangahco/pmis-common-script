#!/usr/bin/env bash

docker save nginx:1.12-alpine | gzip > docker-nginx-1.12.tar.gz
docker save registry_nginx | gzip > docker-registry-nginx.tar.gz
docker save registry_registry | gzip > docker-registry-registry.tar.gz
docker save registry:2 | gzip > docker-registry-2.tar.gz
docker save quay.io/maksymbilenko/oracle-12c:latest | gzip > docker-oracle-12c.tar.gz
docker save sangah/apache-svn | gzip > docker-apache-svn.tar.gz
docker save sangah/pmis-fileupload:latest | gzip > docker-pmis-fileupload.tar.gz
docker save sangah/rabbitmq:latest | gzip > docker-rabbitmq.tar.gz
docker save sangah/nginx-pmis:latest | gzip > docker-nginx-pmis.tar.gz
docker save library/php | gzip > docker-php.tar.gz
docker save sangah/livechat:latest | gzip > docker-livechat.tar.gz
docker save registry.sangah.com/spreadjs-designer | gzip > docker-spreadjs-designer.tar.gz
docker save sangah/web-hub | gzip > docker-web-hub.tar.gz
docker save sangah/pmis-base | gzip > docker-pmis-base.tar.gz
docker save hyper/docker-registry-web | gzip > docker-registry-web.tar.gz
