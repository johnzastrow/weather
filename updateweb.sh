#!/bin/bash
cd /home/jcz/Documents/github/weather
python3 all_sites_weekly_temps.py
python3 e1248weekly_temps.py
python3 e4229weekly_temps.py
python3 e4279weekly_temps.py
python3 kpwm_weekly_temps.py
python3 all_e1248weekly_temps_w_electric.py
python3 energy_stacked.py
python3 weeknum.py
python3 all_e1248weekly_temps_w_electric.py
python3 all_sites_daily_temp_ranges.py
python3 daily_e1248_temps_w_electricity.py
./xfer.sh
