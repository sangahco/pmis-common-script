#!/usr/bin/env sh

DOMAIN=lgsp.kspmis.com

find . -type f -name *.html -exec sed -i "s/url(\/ext\/style\/COMMON\/image\/icon\//url(\/\/$DOMAIN\/ext\/style\/COMMON\/image\/icon\//g" {} \;
find . -type f -name *.html -exec sed -i "s/http:\/\/$DOMAIN/\/\/$DOMAIN/g" {} \;
find . -type f -name *.html -exec sed -i "s/https:\/\/$DOMAIN/\/\/$DOMAIN/g" {} \;
