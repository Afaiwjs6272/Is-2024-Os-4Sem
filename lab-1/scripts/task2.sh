#!/bin/bash

res=""
read word 
while [ "$word" != "q" ]; do
res+="$word"
read word
done

echo "$res"
