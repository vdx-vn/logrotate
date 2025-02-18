#!/bin/sh

while true; do
    logrotate -f /etc/logrotate.d/ # Force log rotation (you can remove -f for normal operation)
    sleep 86400                    # Sleep for 24 hours (86400 seconds) - adjust as needed
done
