mysql -h servername -u username --password=secret \
--skip-column-names -e "SELECT * FROM table where FROM_UNIXTIME(timestamp) >=NOW() - INTERVAL 7 DAY;" | sed 's/\t/;/g;s/\n//g' > week.csv

If you’d like to run the above script on your RasPi server, you can call an SQL query within the 
GNUplot shell script above. Just place the following line to the top of the script.

sudo mysql -uuser -p password -D database -B -e "SELECT * FROM sensors WHERE FROM_UNIXTIME(timestamp) >= NOW() - INTERVAL 7 DAY INTO OUTFILE '/tmp/week.csv' FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n'"
Please note that MySQL has permissions to write only into the /tmp folder on Debian Wheezy.  
Remember that MySQL doesn’t overwrite week.csv if it already exists!



#!/bin/bash
 
# Define title of the plot and print last date of plotting
TITLE="Temperature, Relative Humidity and Pressure until `date +%F\ %T`"
 
# To correct UNIX epoch date and gnuplot epoch date, we have to substract $EPOCH_OFFSET
EPOCH_OFFSET=946684800
 
# Get UNIX epoch date
TODAY="`date +%s`"
 
# Correct offset to 2000-01-01 00:00:00
TODAY=$(expr $TODAY - $EPOCH_OFFSET)
 
# We want to plot values from 24 h
YESTERDAY="`date +%s --date="-1 day"`"
 
# Correct offset to 2000-01-01 00:00:00
YESTERDAY=$(expr $YESTERDAY - $EPOCH_OFFSET)
 
/usr/bin/gnuplot << EOF
 
# Data file uses semikolon as a separator
set datafile separator ';'
 
# Title of the plot
set title "$TITLE"
 
# We want a grid
set grid
 
# Ignore missing values
#set datafile missing "NaN"
 
# Functions for dew point,vapour pressure and g/m3
svp(t)=610*exp(t/(t+238.3)*17.2694)
vp(t,rh)=svp(t)*rh/100
w(t,rh)=log(vp(t,rh)/610.78)
dpt(t,rh)=(w(t,rh)*238.3)/(17.294-w(t,rh))
gm3(t,rh)=vp(t,rh)*2.166/(t+273.16)
 
# X-axis label
set xlabel "Date/Time (CET)"
 
# set X-axis range to current date only
set xrange ["$YESTERDAY":"$TODAY"]
 
# Y-axis ranges from 0 deg C to 100 deg C, same scale as for humidity
set yrange [0:80]
 
# Y2-axis set from 800 to 1200 kPa, used for barometric pressure
set autoscale y2
 
# place ticks on second Y2-axis
set y2tics border
 
# Title for Y-axis
set ylabel "Temperature (C) / Relative Humidity (%)"
 
# Title for Y2-axis
set y2label "Pressure (hPa)"
 
# Define that data on X-axis should be interpreted as time
set xdata time
 
# Time in log-file is given in Unix format
set timefmt "%s"
 
# Display notation for time
set format x "%d.%m\n%R"    # Display time in 24 hour notation on the X axis
 
# generate a legend which is placed underneath the plot
set key outside bottom center box title "RasPi Sensor Data"
 
# output into png file
set terminal png large
set output "/var/www/images/plot.png"
 
# Data columns are:
# 3 is Unix Epoch time
# 4 is Temperature DHT22
# 5 is Humidity DHT22
# 6 is Temperature BMP085
# 7 is Barometric Pressure
# 8 is Altitude
 
# read data from file and generate plot
plot "/var/www/data/week.csv" using 3:4 title "Temperature (C)" with lines \
 ,"" using 3:5 title "Relative Humidity (%)" with lines \
 ,"" using 3:7 title "Barometric Pressure (hPa)" with lines axes x1y2 \
 ,"" using 3:(dpt(\$6,\$5)) title "Dew Point (C)" with lines\
# ,"" using 3:(gm3(\$6,\$5)) title "Dew Point (C)" with lines\
# end of script
EOF



also


filename="/tmp/stats_for"$days"days.csv"
	if [ -f $filename ];then
		echo "CSV file exists. Replacing it with the new one"
		sudo rm $filename
	fi
	echo "Enter MySQL's Password"
	mysql -u user -p yourdatabase -e "select ((hour(createdOn) + 5) % 24), round(count(id)/"$days") from table_name where createdOn between date_sub(now(), interval "$days" day) and now() group by hour(createdOn) into outfile '$filename' fields terminated by ',' lines terminated by '\n';"	
	
	echo "Generating graph now..."
	outputFile="stats_for"$days"days.png"
	gnuplot <<- EOF
	reset
	set terminal png
	set output '$outputFile'
	set grid
	set pointsize 2
	set xlabel "Hour"
	set ylabel "Avg number of requests"
	set datafile sep ','
	set key box
	plot '$filename' using 1:2 smooth csplines lw 2 title 'stats of traffic', \
	'$filename' using 1:2 w p title '(Hr, SMS)';
	EOF


#!/usr/bin/gnuplot -persist
set terminal png nocrop font small size 640,480
set output 'dotplot.png'
set style data histograms
set title "Most Active Sections Of NJ CL for Open Mics"
set xlabel "CL Section Name"
set ylabel "Post Count"
plot "/tmp/bargraph.csv" using 2:xticlabels(1) notitle