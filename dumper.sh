#!/bin/bash

# jcz  6-jan-19
#  dumps mysql database to dated file
##################################

# set vx
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
mysqldump $dbconnect -opt weather > $dater_weatherdump.sql
