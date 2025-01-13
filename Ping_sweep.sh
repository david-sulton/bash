#!/bin/bash

#Simple Ping sweep script
#Usage: ./ping_sweep.sh 192.168.1

if ["$1" -- ""]
then
  echo "Usage: $0 <network-prefix>"
  echo "Example: $0 192.168.1"
  exit
fi

  network=$1

  echo "Starting ping sweep on network $network.0/24..."

  for ip in $(seq 1 254); do
    ping -c 1 -w 1 $network.$ip > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
      echo "Host $network.$ip is up"
    fi
  done

echo "Ping sweep completed."
