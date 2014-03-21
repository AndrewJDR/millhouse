#!/bin/sh

while [ 1 -eq 1 ]; do
	zpool iostat >/dev/null 2>/dev/null
	if [ $? -eq 0 ]; then
		zpool iostat 60 | sh /data/scripts/millhouse.sh -v -t 10 -d da0,da1,da2,da3,da4,da5,da6,da7 | logger -i -t sasidle
	fi
	echo "Waiting for a pool to become active..."
	sleep 60
done
