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
 


/usr/bin/gnuplot << EOF
set grid
set xrange [1483300800:1577822400]
set yrange [-30:100]

# Data columns are:
# 1 is Unix Epoch time
# 2 is Temperature Deg F

set terminal png size 800,600 enhanced font 'arial,8'
set datafile separator ';'
set xdata time
set timefmt "%s"
set format x "%y-%m-%d" 
set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 1 \
    pointtype 7 pointsize .6
# unset key
TITLE="Temperature for $site1 at $(date +%F\ %T)"
set output "E1248outputter"
plot '/tmp/mysql/$site1.csv' using 1:2 with points linestyle 1
EOF

rm /tmp/mysql/*.csv