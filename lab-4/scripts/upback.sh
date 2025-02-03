#!/bin/bash

restore_dir="$HOME/restore/"
backup_dir=$(ls -d $HOME/Backup-* | tail -n 1)
backup_rep="$HOME/backup-report"

if [ ! -d "$backup_dir" ]
then
    exit 1
fi

cp -r $backup_dir/* $restore_dir
echo "Files copied from $backup_dir to $restore_dir:" >> $backup_rep
ls $backup_dir >> $backup_rep
