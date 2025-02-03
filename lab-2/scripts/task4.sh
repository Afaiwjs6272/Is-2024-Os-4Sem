#!/bin/bash

proc4_tmp=$(mktemp)

file="proc4_tmp"

for pid in $(ls /proc | grep "^[0-9]*$") 
do

if [ -e "/proc/$pid/status" ] && [ -e "/proc/$pid/sched" ]
then

ppid=$(grep "PPid:" /proc/$pid/status | awk '{print $2}')
sum_exec_runtime=$(grep "se.sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')        
nr_switches=$(grep "nr_switches" /proc/$pid/sched | awk '{print $3}')

if [ -n "$sum_exec_runtime" ] && [ -n "$nr_switches" ] && [ -n "$ppid" ] 
then

ART=$(awk "BEGIN {print $sum_exec_runtime/$nr_switches}")
echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$ART" >> $file        
fi
fi
done

sort -t '=' -k4n $file -o $file

cat $file


