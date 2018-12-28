#!/bin/bash
# jcz 24-dec-18
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
	weather1="E1248_"$dater".csv"

echo "Date: " $dater >> $outputter
echo "Day: " $dayer >> $outputter
echo "Computer: " $hoster >> $outputter
echo "Directory: "$directory >> $outputter
echo "**********************************" >> $outputter
echo "" >> $outputter
echo "Starting $weather1"
wget -O $weather1 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=E1248&days=56&html=1
echo "Completing $weather1"
exit