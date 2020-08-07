#!/bin/bash

ddd=$(date +"%u")
now=$(date +"%m-%d-%y")
nowyear=$(date +"%Y-%m-%d")
folder=$(ls --full-time /ftpdata/nigh_$ddd | grep $nowyear | awk '{print $6}'| sed '2d')
./distr/FTPmount 2> /dev/null

	if [ "$nowyear" = "$folder" ]
    	  then
     		echo 1

	  else
     		echo 0

echo $folder
fi
