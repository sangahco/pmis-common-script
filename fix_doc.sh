#!/usr/bin/env sh

DOMAIN=pmis.snicm.co.kr
NEW_DOMAIN=pmis.snicm.co.kr

# prefix /ext/style/COMMON/image/icon with domain
find . -type f -name "*.html" -exec sed -i "s/url(\/ext\/style\/COMMON\/image\/icon\//url(\/\/$DOMAIN\/ext\/style\/COMMON\/image\/icon\//g" {} \;
# replace protocol http:// -> //
find . -type f -name "*.html" -exec sed -i "s/http:\/\/$DOMAIN/\/\/$DOMAIN/g" {} \;
# replace protocol https:// -> //
find . -type f -name "*.html" -exec sed -i "s/https:\/\/$DOMAIN/\/\/$DOMAIN/g" {} \;
# replace domain with new one 
find . -type f -name "*.html" -exec sed -i "s/$DOMAIN/$NEW_DOMAIN/g" {} \;
# replace about: -> https:
find . -type f -name "*.html" -exec sed -i "s/about:/https:/g" {} \;
