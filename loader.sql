LOAD DATA LOCAL INFILE 
'/home/jcz/Documents/github/weather/E1248.csv' 
INTO TABLE weather.table_e1248 FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' IGNORE 1 LINES 
(dt_utc,pressure_mbar,pressure_mbar,temp_f,dewpoint_f,humid_perc,
windsp_mph,windir_deg,a_press_mbar,a_temp_f,a_dewp_f,a_humid_perc,a_windsp_mph,a_windir_deg);
