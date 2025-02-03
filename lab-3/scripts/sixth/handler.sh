#!/bin/bash

mode="+"
res=1

handler1(){
mode="+"
}

handler2(){
mode="*"
}

TERM(){
exit 0
}

trap 'handler1' USR1
trap 'handler2' USR2
trap 'TERM' SIGTERM

while true
do
case "$mode" in
"+")
res=$((res + 2))
;;
"*")
res=$((res * 2))
;;
esac

echo $res
sleep 1
done
