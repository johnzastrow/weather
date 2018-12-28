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
	weather1="E1248.csv"
	weather1b="E1248_"$dater".csv"
	loadersql = "LOAD DATA LOCAL INFILE 'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\$weather1' INTO TABLE weather.table_e1248 FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES (`dt_utc`,`pressure_mbar`,`pressure_mbar`,`temp_f`,`dewpoint_f`,`humid_perc`,`windsp_mph`,`windir_deg`,`a_press_mbar`,`a_temp_f`,`a_dewp_f`,`a_humid_perc`,`a_windsp_mph`,`a_windir_deg`);"

echo "Date: " $dater >> $outputter
echo "Day: " $dayer >> $outputter
echo "Computer: " $hoster >> $outputter
echo "Directory: "$directory >> $outputter
echo "**********************************" >> $outputter
echo "" >> $outputter
echo "Starting $weather1"
wget -O $weather1 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=E1248&days=56&html=1
cp $weather1 $weather1b
echo "Completing $weather1"
echo "calling mysql"
 "C:\\Program Files\\MariaDB 10.3\bin\mysql.exe" -uroot -pyub.miha weather $loadersql
 
 echo "done loading"