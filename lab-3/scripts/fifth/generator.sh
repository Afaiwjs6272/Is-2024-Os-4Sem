#!/bin/bash

while true
do
read input
echo "$input" > pipe

if [[ $input == "QUIT" ]]
then
exit 0
fi
done
