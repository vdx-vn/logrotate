#!/bin/sh

# Configure cron schedule (default to every hour)
CRON_SCHEDULE=${CRON_SCHEDULE:-"0 * * * *"}
cp -r /conf/. /etc/logrotate.d/

# Function to run logrotate
run_logrotate() {
    echo "Running logrotate..."
    /usr/sbin/logrotate -v /etc/logrotate.d/*.conf
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
        echo "Logrotate completed successfully"
    else
        echo "Logrotate failed with exit code $exit_code"
    fi
}

# Setup cron job
echo "$CRON_SCHEDULE /usr/sbin/logrotate -v /etc/logrotate.d/*.conf" >/etc/crontabs/root

# Initial run
run_logrotate

# Start crond in foreground
echo "Starting crond..."
crond -f -d 8
