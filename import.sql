LOAD DATA
LOCAL INFILE 'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\testtxt.csv' 
IGNORE 
INTO TABLE `weather`.`datetest` 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES (@ColVar0) 
SET `dt_utc` = REPLACE(REPLACE(@ColVar0, ',', ''), '.', '.');
-- truncate datetest;