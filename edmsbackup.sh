#!/bin/sh

SOURCE=$1
TARGET=$2
rsync -azv --no-g --no-o $SOURCE $TARGET