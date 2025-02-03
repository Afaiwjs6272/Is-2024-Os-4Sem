#!/bin/bash

file="proc5_tmp"

for pid in $(ls /proc | grep "^[0-9]*$")
do
if [ -e "/proc/$pid/status" ] && [ -e "/proc/$pid/sched" ]
then
ppid=$(grep "PPid:" /proc/$pid/status | awk '{print $2}')
sum_exec_runtime=$(awk '/se.sum_exec_runtime/ {print $3}' /proc/$pid/sched)
nr_switches=$(awk '/nr_switches/ {print $3}' /proc/$pid/sched)
if [ -n "$sum_exec_runtime" ] && [ -n "$nr_switches" ] && [ -n "$ppid" ] 
then
ART=$(awk "BEGIN {print $sum_exec_runtime/$nr_switches}")
echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$ART"
fi
fi
done > $file

sort -t '=' -k4n -o $file $file

awk -F'=' '{sum[$4]+=$NF; count[$4]++} END {for (parent_pid in sum) print "Average_Running_Children_of_ParentID="parent_pid" is "sum[parent_pid]/count[parent_pid]}' $file >> $file

cat $file

