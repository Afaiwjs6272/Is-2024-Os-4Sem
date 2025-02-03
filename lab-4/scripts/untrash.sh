#!/bin/bash

if [ $# -ne 1 ]; then
    exit 1
fi

file=$1
trash_log="$HOME/.trash.log"
restore_dir="$HOME/restore"

res=$(grep -w "$file" $trash_log)

if [ -z "$res" ]; then
    echo "file not found"
    exit 1
fi

echo "Found this:"
echo "$res"
read -p "Restore this file? [Y/*]: " ans

while read line
do
   if [ "$ans" == "Y" ]
then

        path=$(echo $line | awk '{print $1}')
        name=$(echo $line | awk '{print $2}')

        if [ -d $(dirname $path) ] then
            if ! ln $name $path  then
                read -p "Unable to create hard link. Please enter a new name for the restored file: " new_name
                if [ -e "$path/$new_name" ] then
                    echo "File with the same name already exists. Cannot restore the file."
                else
                    mv $name "$path/$new_name"
                fi
            else
                rm $name
            fi
        else
            cp $name $restore_dir
            echo "File goes to $restore_dir"
            rm $name
        fi

        sed -i "/$line/d" $trash_log
    done <<< "$res"
fi

