#!/bin/bash
line="+"
res=1
tail -f pipe |
while true
do
read input
case $input in
"+")
line=$input
echo "addition"
;;
"*")
line=$input
echo "multiply"
;;
"QUIT")
exit 0
;;
"[0-9]*")
if [[ $line = "+" ]]
then
res=$(( res + input ))
echo "$res"
elif [[ $line = "*" ]]
then
res=$(( res * input ))
echo "$res"
fi
;;
*)
exit 1
;;
esac
done
