#!/usr/bin/env bash

SCRIPT_BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${SCRIPT_BASE_PATH}"

find . -type d -ls | python -c '
import sys
for line in sys.stdin:
    r = line.strip("\n").split(None, 10)
    fn = r.pop()
    print ",".join(r) + ",\"" + fn.replace("\"", "\"\"") + "\""
'
