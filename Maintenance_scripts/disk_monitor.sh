#!/bin/bash

set -euo pipefail

#Script creates warning if the disk usage is above 80%

alert_threshold=80

disk_info=`df -h`

while read -r line; do
  disk_name=`echo $line | awk '{print $1}'`
  disk_used=`echo $line | awk '{print $5}' | cut -d'%' -f1`

  if [ "$disk_used" -ge "$alert_threshold" ]; then
    echo "Disk usage on $disk_name is at $disk_used%, which is above the alert threshold of $alert_threshold%."
  fi
done <<< "$disk_info"