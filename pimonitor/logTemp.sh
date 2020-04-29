#!/bin/bash

while true
do
  temp=`vcgencmd measure_temp | egrep -o '[0-9]*\.[0/9]*'`
  timestamp=`date +'%F %T'`
  host=`hostname`
  message="{ \"system.cpu.temp\" : ${temp}, \"host.name\" : \"${host}\" }"
  #echo $message
  curl -s -H "content-type: application/json" -XPUT 'http://127.0.0.1:5045' -d "$message" > /dev/null
  #printf "%-15s%5s\n" "$timestamp" "$temp"
  sleep 1
done
