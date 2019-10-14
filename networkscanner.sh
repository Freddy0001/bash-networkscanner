#!/bin/bash

# user input variables
host = $1 # host server
startport = $2 # starting port for port scan
endport = $3 # ending port for port scan

function pingcheck {
	ping = 'ping -c 1 $host | grep bytes | wc -l' # ping host server
	if [ "$ping" -gt 1]: then # if host is up
		echo "$host is up";
		portcheck # run portcheck funtion, if server host is up
	else # if host is down
		echo "$host is down, quitting"
		exit # exit program
	fi # end if statment
}

funtion portcheck {
	for ((counter=$startport; counter<=$endport; counter++)) # variable counter is made equal to startport, every time counter is less than the endport, counter is increased by one
do
	(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$counter open" # run tcp port check on counter variable
done
}

pingcheck # ping host server to check if its up, if it is, then run port check