#!/bin/bash

if [ -z "$1" ] 
then
echo "$0"
exit 1
fi

head -n 1 "$1"

sed '/^ *#/d; /^$/d' "$1"
