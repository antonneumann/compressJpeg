#!/bin/bash

function convertFile {
    if [ -f "$1" ]; then
        echo "Compressing $1";
        convert "$1" -quality 85 -strip -interlace Plane -gaussian-blur 0.05 "$1"
    fi
}

if [ -d "$1" ]; then
    for file in "$1"/*.{jpeg,jpg,JPG}; do
        convertFile $file;
    done
else
    convertFile $1
fi
