#!/bin/bash

if [ $# -ne 1 ]
then
    exit 1
fi

file=$1
trash_dir="$HOME/.trash"

if [ ! -d "$trash_dir" ]
then
    mkdir $trash_dir
fi

name="$trash_dir/$(basename $file)_$(date +"%s")"
ln $file $name
echo "$(readlink -f $file) $name" >> "$HOME/.trash.log"
rm $file
