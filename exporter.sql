SELECT UNIX_TIMESTAMP(dt_utc), temp_f  INTO OUTFILE '/tmp/mysql/E4229.csv' 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' FROM `weather`.`E4229`;

SELECT UNIX_TIMESTAMP(dt_utc), temp_f  INTO OUTFILE '/tmp/mysql/E1248.csv' 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' FROM `weather`.`E1248`;

SELECT UNIX_TIMESTAMP(dt_utc), temp_f  INTO OUTFILE '/tmp/mysql/E4279.csv' 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' FROM `weather`.`E4279`;

SELECT UNIX_TIMESTAMP(dt_utc), temp_f  INTO OUTFILE '/tmp/mysql/KPWM.csv' 
FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' FROM `weather`.`KPWM`;