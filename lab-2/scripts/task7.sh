#!/bin/bash

proc7_tmp=$(mktemp)
ps -eo pid,cmd | while read pid cmd
do
bytes=$(grep -o "read_bytes: [0-9]*" /proc/$pid/io 2>/dev/null | cut -d ' ' -f 2)   
if [[ ! -z "$bytes" ]]
then
echo "$pid:$cmd:$bytes" >> $proc7_tmp
fi
done

sleep 60
sort -t ':' -nk3,3 -r -o $proc7_tmp $proc7_tmp
head -n 3 $proc7_tmp | awk -F ":" '{print $1": "$2": "$3}'

rm $proc7_tmp

