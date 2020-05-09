#!/bin/bash

args="$@"

args="$@ -p 80"

module=""

file=/data/db.json
if [ -f $file ]; then
    echo "Found db.json, trying to open"
    args="$args $file"
fi

file=/data/file.js
if [ -f $file ]; then
    echo "Found file.js seed file, trying to open"
    args="$args $file"
fi

file=/data/server.js
if [ -f $file ]; then
    echo "Found server.js customization file, using json-server as npm module"
    args=""
    module="$file"
fi

if [ -z $module ]; then
	json-server $args
else
	node $module
fi
