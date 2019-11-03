#!/bin/bash
cd /home/jcz/Documents/github/weather
python3 all_sites_weekly_temps.py
python3 e1248weekly_temps.py
python3 e4229weekly_temps.py
python3 e4279weekly_temps.py
python3 kpwm_weekly_temps.py
python3 weeknum.py
./xfer.sh
