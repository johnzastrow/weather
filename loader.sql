LOAD DATA LOCAL INFILE 
'/home/jcz/Documents/github/weather/jobs/E1248.csv' 
-- ignore allows import to skip dupe rows
IGNORE INTO TABLE weather.E1248 FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' IGNORE 1 LINES 
(dt_utc,pressure_mbar,temp_f,dewpoint_f,humid_perc,
windsp_mph,windir_deg,a_press_mbar,a_temp_f,a_dewp_f,a_humid_perc,a_windsp_mph,a_windir_deg);

LOAD DATA LOCAL INFILE 
'/home/jcz/Documents/github/weather/jobs/KPWM.csv' 
-- ignore allows import to skip dupe rows
IGNORE INTO TABLE weather.KPWM FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' IGNORE 1 LINES 
(dt_utc,pressure_mbar,temp_f,dewpoint_f,humid_perc,
windsp_mph,windir_deg,a_press_mbar,a_temp_f,a_dewp_f,a_humid_perc,a_windsp_mph,a_windir_deg);

LOAD DATA LOCAL INFILE
'/home/jcz/Documents/github/weather/jobs/E4279.csv'
-- ignore allows import to skip dupe rows
IGNORE INTO TABLE weather.E4279 FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' IGNORE 1 LINES
(dt_utc,pressure_mbar,temp_f,dewpoint_f,humid_perc,
windsp_mph,windir_deg,a_press_mbar,a_temp_f,a_dewp_f,a_humid_perc,a_windsp_mph,a_windir_deg);

LOAD DATA LOCAL INFILE
'/home/jcz/Documents/github/weather/jobs/E4229.csv'
-- ignore allows import to skip dupe rows
IGNORE INTO TABLE weather.E4229 FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' IGNORE 1 LINES
(dt_utc,pressure_mbar,temp_f,dewpoint_f,humid_perc,
windsp_mph,windir_deg,a_press_mbar,a_temp_f,a_dewp_f,a_humid_perc,a_windsp_mph,a_windir_deg);
