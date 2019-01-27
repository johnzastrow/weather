#!/bin/bash
# jcz 16-jan-19
# create charts of data to see coverage
# in the directory in which it is run
##################################

# set vx
# Date and other variables pretty self explanatory, S is seconds
# date format is currently YYYYMMDD_HHMMSS

./exporter.sh
	
	dater=$(date +%Y%m%d_%H%M%S)
	dater=$(date +%Y%m%d_%H%M%S)
	output_place="/home/jcz/Documents/github/weather/"
    E1248outputter=$output_placeplot"E1248"$(date +%Y-%m-%d-%S).png
	 
    site1="E1248"
	weather1b=$output_place"E1248_plot$dater.csv"
	

     cd /home/jcz/Documents/github/weather
 
# Define title of the plot and print last date of plotting
# TITLE="Temperature for $site1 at $(date +%F\ %T)"
 
# To correct UNIX epoch date and gnuplot epoch date, we have to substract $EPOCH_OFFSET
# EPOCH_OFFSET=946684800
 
# Get UNIX epoch date
# TODAY=$(date +%s)
 
# Correct offset to 2000-01-01 00:00:00
# TODAY=$(expr $TODAY - $EPOCH_OFFSET)
 
# We want to plot values from 24 h
# YESTERDAY=$(date +%s --date="-1 day")
 
# Correct offset to 2000-01-01 00:00:00
# YESTERDAY=$(expr $YESTERDAY - $EPOCH_OFFSET)

# source my.config
# echo $dbconnect
# query="SELECT UNIX_TIMESTAMP(dt_utc), temp_f  INTO OUTFILE $weather1b FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' FROM $site1;"
# mysql $dbconnect --skip-column-names weather -e $query

# echo $query
# echo "$weather1b"

/usr/bin/gnuplot << EOF

# Data file uses semikolon as a separator
set datafile separator ';'
 
# Title of the plot
# set title "$TITLE"
 
# We want a grid
set grid
 
# Ignore missing values
#set datafile missing "NaN"

# set X-axis range to current date only
# SELECT UNIX_TIMESTAMP('2019-12-31 12:00:00');
# SELECT UNIX_TIMESTAMP('2017-01-01 12:00:00');

set xrange [1483300800:1577822400]
 
# Y-axis ranges in deg F
set yrange [-30:100]


# Data columns are:
# 1 is Unix Epoch time
# 2 is Temperature Deg F

 
# read data from file and generate plot

set terminal png size 800,600 enhanced font 'arial,8'
set datafile separator ';'
set xdata time
set timefmt "%s"
set format x "%y-%m-%d" 
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 1 \
    pointtype 7 pointsize .6
set style line 2 \
    linecolor rgb '#932811' \
    linetype 1 linewidth 1 \
    pointtype 7 pointsize .6
unset key
TITLE="Temperature for $site1 at $(date +%F\ %T)"
set output "E1248outputter"
plot '/tmp/mysql/$site1.csv' using 1:2 with points linestyle 1

EOF

rm /tmp/mysql/*.csv