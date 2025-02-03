#!/bin/bash

declare -a array=()
declare -a nums=(1,2,3,4,5,6,7,8,9,10)
counter=0

while true
 do
       array+=(${nums[@]})
let counter++
if [[ $counter ==  10000 ]] then
       echo "${#array[@]}" >> report.log
       counter=0
fi
done
