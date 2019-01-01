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
	
	site1="E1248"
	weather1="E1248.csv"
	weather1b="E1248_"$dater".csv"
	
	site2="KPWM"
	weather2="KPWM.csv"
	weather2b="KPWM_"$dater".csv"
	
	site3="E4229"
	weather3="E4229.csv"
	weather3b="E4229_"$dater".csv"
	
	site4="E4279"
	weather4="E4279.csv"
	weather4b="E4279_"$dater".csv"

echo "Date: " $dater >> $outputter
echo "Day: " $dayer >> $outputter
echo "Computer: " $hoster >> $outputter
echo "Directory: "$directory >> $outputter
echo "**********************************" >> $outputter
echo "" >> $outputter
echo "There are this many records in database to start"
./stats.sh
echo ""
echo ""
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Starting Weather download"
echo "Starting $weather1"
wget -v -O $weather1 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site1&days=56&csv=1
echo "waiting to be done " $weather1
wait

echo "Completing $weather1"
echo ""
echo "Starting $weather2"
wget -v -O $weather2 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site2&days=56&csv=1
echo "waiting to be done " $weather2
wait

echo "Completing $weather2"

echo "Starting $weather3"
wget -v -O $weather3 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site3&days=56&csv=1
echo "waiting to be done " $weather3
wait

echo "Completing $weather3"


echo "Starting $weather4"
wget -v -O $weather4 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site4&days=56&csv=1
echo "waiting to be done " $weather4
wait

echo "Completing $weather4"


echo ""
echo "calling mysql"
 mysql -uroot -pyub.miha weather < loader.sql
 echo "done loading"

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo ""
echo "There are this many records in database after loading"
./stats.sh
