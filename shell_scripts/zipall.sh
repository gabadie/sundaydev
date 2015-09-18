#!/bin/sh

all=./*

for directory in $all; do
    echo "$directory.zip" ;
    zip -r "$directory.zip" "$directory" ;
    rm -rf "$directory" ;
    echo ;
    echo ;
done;
