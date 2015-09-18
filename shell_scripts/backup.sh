#!/bin/sh

dest=$1
self=$0
directories=./docs.*

cp "$self" "$dest"

for directory in $directories; do
    echo "# \033[32m$directory\033[0m" ;
    rsync -adPvv "$directory" "$dest" ;
    echo ;
    echo ;
done;

