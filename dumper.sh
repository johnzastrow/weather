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

source my.config
echo $pwd
echo $directory
cd /home/jcz/Documents/github/weather
echo $pwd
mysqldump $dbconnect -v --opt weather > ./$dater_weatherdump.sql
