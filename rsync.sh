#!/bin/sh

set -e

SOURCE=$1
TARGET=$2
rsync --archive --compress --verbose --no-g --no-o $SOURCE $TARGET