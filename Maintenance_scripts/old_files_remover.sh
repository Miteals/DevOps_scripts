#!/bin/bash

set -euo pipefail

#Script finds and deletes all files older than x days in directory

search_dir=$1
file_age=$1

find $search_dir -type f -mtime +$file_age -delete
