#!/bin/bash

for dir in /proc/[0-9]*/
do
pid=$(basename "$dir")
vmsize=$(grep VmRSS "$dir/status" | awk '{print $2}')
echo "$pid,$vmsize"

done | sort -nk5 | tail -n1

