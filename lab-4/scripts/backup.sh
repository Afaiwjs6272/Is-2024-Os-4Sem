#!/bin/bash

backup_dir="$HOME/Backup-$(date +"%Y-%m-%d")"
source_dir="$HOME/source"
backup_rep="$HOME/backup-report"

backup=$(find $HOME -maxdepth 1 -type d -name "Backup*" -mtime -7)

if [ -z "$current_backup" ]
then
    mkdir $backup_dir
    echo "New directory was created: $backup_dir" >> $backup_rep
else
    backup_dir=$backup
fi

if [ ! -d "$backup_dir" ]
then
    echo "Error"
    exit 1
fi

cp_files() {
    for file in $1/*; do
        filename=$(basename $file)
        if [ -f "$backup_dir/$filename" ]
           then
            source_size=$(stat -c %s "$file")
            backup_size=$(stat -c %s "$backup_dir/$filename")
            if [ $source_size -ne $backup_size ]; then
                cp "$file" "$backup_dir/$filename.$(date +"%Y-%m-%d")"
                echo "Version copy of $filename created as $filename.$(date +"%Y-%m-%d")" >> $backup_rep
            fi
        else
            cp "$file" "$backup_dir/$filename"
        fi
    done
}

cp_files $source_dir

echo "Files copied from $source_dir to $backup_dir:" >> $backup_rep
ls $source_dir >> $backup_rep

