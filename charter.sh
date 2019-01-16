#!/bin/bash
# jcz 16-jan-19
# create charts of data to see coverage
# in the directory in which it is run
##################################

# set vx
# Date and other variables pretty self explanatory, S is seconds
# date format is currently YYYYMMDD_HHMMSS
	
	dater=$(date +%Y%m%d_%H%M%S)
	dater=$(date +%Y%m%d_%H%M%S)
	output_place="/home/jcz/Documents/github/weather/"
    outputter=$output_placeplot$(date +%Y-%m-%d).png
 
    site1="E1248"
	weather1b=$output_place"E1248_plot$dater.csv"
	
	site2="KPWM"
	weather2b=$output_place"KPWM_plot$dater.csv"
	
	site3="E4229"
	weather3b=$output_place"E4229_plot$dater.csv"
	
	site4="E4279"
	weather4b=$output_place"E4279_plot$dater.csv"

     cd /home/jcz/Documents/github/weather
 
# Define title of the plot and print last date of plotting
TITLE="Temperature for $site1 at $(date +%F\ %T)"
 
# To correct UNIX epoch date and gnuplot epoch date, we have to substract $EPOCH_OFFSET
EPOCH_OFFSET=946684800
 
# Get UNIX epoch date
TODAY=$(date +%s)
 
# Correct offset to 2000-01-01 00:00:00
TODAY=$(expr $TODAY - $EPOCH_OFFSET)
 
# We want to plot values from 24 h
YESTERDAY=$(date +%s --date="-1 day")
 
# Correct offset to 2000-01-01 00:00:00
YESTERDAY=$(expr $YESTERDAY - $EPOCH_OFFSET)

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
set title "$TITLE"
 
# We want a grid
set grid
 
# Ignore missing values
#set datafile missing "NaN"

# set X-axis range to current date only
set xrange ["$YESTERDAY":"$TODAY"]
 
# Y-axis ranges in deg F
set yrange [-30:100]


# Data columns are:
# 1 is Unix Epoch time
# 2 is Temperature Deg F

 
# read data from file and generate plot

set terminal png size 600,800 enhanced font 'arial,9'
set datafile separator ';'
set xdata time
set timefmt "%s"
set format x "%y-%m-%d" 
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5
unset key
set output "$outputter"
plot "/tmp/E1248.csv" with points linestyle 1

EOF