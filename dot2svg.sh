#!/bin/bash

dot_fullpath=$1
if [[ ! -f "$dot_fullpath" ]]; then
    echo "ERROR! $dot_fullpath not found"
    exit 1
fi

dot_filename=$(basename -- "$dot_fullpath")
dot_dirname=$(dirname -- "$dot_fullpath")
dot_extension="${dot_filename##*.}"
dot_filename="${dot_filename%.*}"

svg_filename=${dot_filename}.svg
svg_fullpath=${dot_dirname}/${svg_filename}

echo "Converting $dot_fullpath to ${svg_fullpath} file"

dot $dot_fullpath -Tsvg > ${svg_fullpath}
