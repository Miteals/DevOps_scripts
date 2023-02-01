#!/bin/bash

set -euo pipefail

#Script creates backup of current directory, compresses them using tar.gz 
#and saves backup files in the /backup dir with the current date

backup_dir=@1
today=`date +%Y%m%d`

if [ ! -d "$backup_dir" ]; then
  mkdir $backup_dir
fi

tar -zcvf "$backup_dir/backup-$today.tar.gz" .