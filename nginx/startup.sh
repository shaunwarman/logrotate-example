#!/bin/bash

echo "Starting nginx container..."

# start cron service
sudo service cron start

# stay up forevers - not recommended
{
    while true
    do
        sleep 60
    done
}
