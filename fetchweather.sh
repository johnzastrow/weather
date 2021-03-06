#!/bin/bash
# jcz 24-dec-18
# fetch text dumps of local weather data
# in the directory in which it is run
##################################

# set vx
# Date and other variables pretty self explanatory, S is seconds
# date format is currently YYYYMMDD_HHMMSS

cd /home/jcz/Documents/github/weather
	outputter=weatherlog$(date +%Y-%m-%d).txt
	dater=$(date +%Y%m%d_%H%M%S)
	dayer=$(date +%a)
	longdate=$(date)
	namer=$(whoami)
	hoster=$(hostname)
	directory=$(pwd)
	output="/home/jcz/Documents/github/weather/jobs/"
	outputter=$output"weatherlog$(date +%Y-%m-%d).txt"
        runner="/home/jcz/Documents/github/weather"


	site1="E1248"
	weather1="E1248.csv"
	weather1b=$output"E1248_$dater.csv"
	
	site2="KPWM"
	weather2="KPWM.csv"
	weather2b=$output"KPWM_$dater.csv"
	
	site3="E4229"
	weather3="E4229.csv"
	weather3b=$output"E4229_$dater.csv"
	
	site4="E4279"
	weather4="E4279.csv"
	weather4b=$output"E4279_$dater.csv"

echo "Sourcing the config..."

source my.config

mkdir -p $output
# cd $output
echo $directory
echo " ************************************* " >> $outputter
echo "Date: " $longdate >> $outputter
echo "Day: " $dayer >> $outputter
echo "Whoami: " $namer >> $outputter
echo "Computer: " $hoster >> $outputter
echo "Directory: "$directory >> $outputter
echo "**********************************" >> $outputter
echo "" >> $outputter
echo "There are this many records in database to start" >> $outputter
echo $dbconnect

# how many records are in the db before we insert

for table in $(mysql $dbconnect -D weather -Bse "show tables");
do 
    echo "------" 
    echo $table ": " 
    mysql $dbconnect -D weather -se "select count(*) from $table"; 
done

# cd $runner
/home/jcz/Documents/github/weather/./stats.sh  >> $outputter

cd $output
echo "" >> $outputter
echo "" >> $outputter
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> $outputter
echo "I am outputter: " $outputter
echo "I am output and weather2: " $output$weather2
echo ""

echo "Starting Weather download" 
echo "Starting $weather1"
wget -v -O $output$weather1 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site1&days=56&csv=1
echo "waiting to be done " $weather1
wait
cp -v $weather1 $weather1b >> $outputter
echo "copying to $weather1b"

echo "Completing $weather1"
echo ""
echo "Starting $weather2"
wget -v -O $output$weather2 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site2&days=56&csv=1
echo "waiting to be done " $weather2
wait
cp -v $weather2 $weather2b >> $outputter

echo "Completing $weather2"

echo "Starting $weather3"
wget -v -O $output$weather3 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site3&days=56&csv=1
echo "waiting to be done " $weather3
wait
cp -v $weather3 $weather3b >> $outputter

echo "Completing $weather3"


echo "Starting $weather4"
wget -v -O $output$weather4 -a $outputter https://weather.gladstonefamily.net/cgi-bin/wxobservations.pl?site=$site4&days=56&csv=1
echo "waiting to be done " $weather4
wait
cp -v $weather4 $weather4b >> $outputter
echo "Completing $weather4"

# Running the loading script
cd $runner
echo ""  >> $outputter
echo "calling mysql"
 mysql $dbconnect  weather < loader.sql  >> $outputter
 echo "done loading" >> $outputter

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  >> $outputter
echo "" >> $outputter
echo "" >> $outputter

echo "There are this many records in database after loading" >> $outputter

# how many records are in the db after we insert

for table in $(mysql $dbconnect -D weather -Bse "show tables");
do 
    echo "------" 
    echo $table ": " 
    mysql $dbconnect -D weather -se "select count(*) from $table"; 
done

./stats.sh  >> $outputter

echo " *************** END *********************** "  >> $outputter
echo ""  >> $outputter
echo ""  >> $outputter
echo " ------------------------------------------------- "  >> $outputter
