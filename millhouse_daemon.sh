#!/bin/sh

( while [ 1 -eq 1 ]; do
        sleep 60
        zpool iostat >/dev/null 2>/dev/null
        if [ $? -eq 0 ]; then
                echo "Starting millhouse..." | logger -i -t sasidle
                sh /data/scripts/millhouse.sh -v -t 10 --interval 60 --pool drzfs -d da0,da1,da2,da3,da4,da5,da6,da7
                exit
        fi
        echo "Waiting for a pool to become active..." | logger -i -t sasidle
done ) &
