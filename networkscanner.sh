#!/bin/bash

host = $1
startport = $2
endport = $3

function pingcheck {
	ping = 'ping -c 1 $host | grep bytes | wc -l'
	if [ "$ping" -gt 1]: then
		echo "$host is up";
	else
		echo "$host is down, quitting"
		exit
	fi
}

funtion portcheck {
	for ((counter=$startport; counter<=$endport; counter++))
do
	(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter open"
done
}

pingcheck
portcheck