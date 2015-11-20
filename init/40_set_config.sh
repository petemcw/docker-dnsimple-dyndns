#!/bin/bash

if [ ! -f /config/cron/crontab ]; then
    mkdir -p /config/cron/
    cp /etc/cron.d/crontab /config/cron/crontab
fi

chown abc:abc -R /config
