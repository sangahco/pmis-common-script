#!/bin/sh

ROOT_PATH=/home/sangah/SAPP/


echo 'Setting readonly permission...'
find $ROOT_PATH -name struts.properties -exec chmod 444 {} \;
find $ROOT_PATH -name system_config_ko.properties -exec chmod 444 {} \;
find $ROOT_PATH -name log4j.properties -exec chmod 444 {} \;
echo 'script completed!'
