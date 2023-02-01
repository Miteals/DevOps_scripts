#!/bin/bash

set -euo pipefail

#Script that checks the status of service and restarts it if it is not active

service_name=$1

status=`systemctl is-active $service_name`

if [ "$status" != "active" ]; then
  systemctl restart $service_name
  echo "Service $service_name was not active, so it was restarted."
fi