#!/bin/bash

MAX=90
storage=$(df -h | grep nvme0n1p2 | awk '{print $5}')
echo "$storage"

val=${storage::-1}
echo "$val"

if [ "$val" -gt $MAX ]; then
    dockersize=$(doas du -h -s /var/lib/docker/overlay2 | awk '{print $1}')
    notify-send "disk: $storage docker: $dockersize"
    /usr/bin/python3 /usr/bin/x-terminal-emulator -e "/bin/sh -i -c \"watch df -h\""
fi
