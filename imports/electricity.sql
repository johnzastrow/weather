LOAD DATA LOCAL INFILE 
'/home/jcz/Documents/github/weather/imports/electricity_data.csv' 
IGNORE INTO TABLE weather.electric_use FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
(@dummy1,@dummy2,@dummy3,@datetimer,@dummy4,kwh,notes)
SET Intervaldatetime = (str_to_date(@datetimer,'%m/%e/%Y %I:%i:%S %p'));
