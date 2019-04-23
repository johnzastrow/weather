#!/bin/bash

# jcz  6-jan-19
#  dumps mysql database to dated file
##################################

 set vx
# Date and other variables pretty self explanatory, S is seconds
# date format is currently YYYYMMDD_HHMMSS
        outputter=log$(date +%Y-%m-%d).txt
        dater=$(date +%Y%m%d_%H%M%S)
        dayer=$(date +%a)
        longdate=$(date)
        namer=$(whoami)
        hoster=$(hostname)
        directory=$(pwd)

        output="/home/jcz/Documents/github/weather/jobs/"
        outputter=$output"weatherlog$(date +%Y-%m-%d).txt"
        runner="/home/jcz/Documents/github/weather"


source my.config
echo $pwd
echo $directory
cd /home/jcz/Documents/github/weather
echo $pwd
mysqldump $dbconnect -v --opt weather > ./$dater_weatherdump.sql
mkdir -p archive


# /usr/bin/find /path/to/files/ -type f -name '*.jpg' -mtime +10 -exec mv {} /path/to/archive/ \;
# /usr/bin/find /path/to/archive/ -type f -name '*.jpg' -mtime +30 -exec rm {} \;
