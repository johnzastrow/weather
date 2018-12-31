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
	weather3="E4229.csv"
	weather3b="E4229_"$dater".csv"
	weather3="E4279.csv"
	weather3b="E4279_"$dater".csv"
	# loadersql="LOAD DATA LOCAL INFILE '/home/jcz/Documents/github/weather/$weather1' INTO TABLE weather.table_e1248 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (dt_utc,pressure_mbar,pressure_mbar,temp_f,dewpoint_f,humid_perc,windsp_mph,windir_deg,a_press_mbar,a_temp_f,a_dewp_f,a_humid_perc,a_windsp_mph,a_windir_deg);"

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

mysql -uroot -pyub.miha weather < initial.sql
echo "Starting Weather download"
echo "Starting $weather1"
wget -v -O $weather1 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=E1248&days=56&csv=1
echo "waiting to be done"
wait
echo "Copying datafile"
cp $weather1 $weather1b
echo "Completing $weather1"
echo ""
echo "Starting $weather2"
wget -v -O $weather2 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site2&days=56&csv=1
echo "waiting to be done"
wait
echo "Copying datafile"
cp $weather2 $weather2b
echo "Completing $weather2"
echo ""
echo "calling mysql"
 mysql -uroot -pyub.miha weather < loader.sql
 echo "done loading"

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo ""
echo ""
echo "There are this many records in database after loading"
./stats.sh
