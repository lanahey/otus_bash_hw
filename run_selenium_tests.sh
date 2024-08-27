#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <url> <browser> <version>"
    exit 1
fi

URL=$1
BROWSER=$2
VERSION=$3

mvn clean test -Dbrowser=$BROWSER -DbrowserVersion=$VERSION -DgridUrl=http://localhost:4444/wd/hub -DbaseUrl=$URL
