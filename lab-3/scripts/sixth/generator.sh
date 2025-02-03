#!/bin/bash

while true
do
read input
case "$input" in
"+")
kill -USR1 $1
;;
"*")
kill -USR2 $1
;;
"TERM")
kill -TERM $1
exit 0
;;
*)
continue
;;
esac
done
