#!/bin/bash

declare -a array=()
declare -a nums=(1,2,3,4,5,6,7,8,9,10)

N=$1

while true
do
         array+=(${nums[@]})
         if [[ "${#array[@]}" -gt $N ]]
                then
                    break
                fi
done

