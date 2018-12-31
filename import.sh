#!/bin/bash
# jcz 31-dec-18
# fetch text dumps of local weather data
# in the directory in which it is run
##################################

# set vx
# Date and other variables pretty self explanatory, S is seconds
# date format is currently YYYYMMDD_HHMMSS
	outputter=weatherlog$(date +%Y-%m-%d).txt
	dater=$(date +%Y%m%d_%H%M%S)
	dater=$(date +%Y%m%d_%H%M%S)
	dayer=$(date +%a)
	namer=$(whoami)
	hoster=$(hostname)
	directory=$(pwd)
 
	
echo "There are this many records in database to start"
./stats.sh
echo ""
echo ""
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

mysql -uroot -pyub.miha weather < import.sql

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo ""
echo "There are this many records in database after loading"
./stats.sh
