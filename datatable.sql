CREATE TABLE `table_e1248m` (
	`id` INT(11) auto_increment,
	`Column 2` DOUBLE NULL DEFAULT NULL,
	`dt_utc` DATETIME NULL DEFAULT NULL,
	`pressure_mbar` DOUBLE NULL DEFAULT NULL,
	`temp_f` DOUBLE NULL DEFAULT NULL,
	`dewpoint_f` DOUBLE NULL DEFAULT NULL,
	`humid_perc` DOUBLE NULL DEFAULT NULL,
	`windsp_mph` DOUBLE NULL DEFAULT NULL,
	`windir_deg` DOUBLE NULL DEFAULT NULL,
	`a_press_mbar` DOUBLE NULL DEFAULT NULL,
	`a_temp_f` DOUBLE NULL DEFAULT NULL,
	`a_dewp_f` DOUBLE NULL DEFAULT NULL,
	`a_humid_perc` DOUBLE NULL DEFAULT NULL,
	`a_windsp_mph` DOUBLE NULL DEFAULT NULL,
	`a_windir_deg` DOUBLE NULL DEFAULT NULL,
	`ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
)
COMMENT='The table for raw E1248 data'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
CHECKSUM=1
;


https://mariadb.com/kb/en/library/load-data-infile/

LOAD DATA LOW_PRIORITY LOCAL INFILE 
'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\E1248_20181226_151309.csv' 
IGNORE INTO TABLE `weather`.`table_e1248m` 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
ESCAPED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES 
(`dt`, @ColVar3, @ColVar4, @ColVar5, @ColVar6, @ColVar7, @ColVar8, @ColVar9, @ColVar10, 
@ColVar11, @ColVar12, @ColVar13, @ColVar14) 
SET 
`pressure_mbar` = REPLACE(REPLACE(@ColVar3, ',', ''), '.', '.'), 
`temp_f` = REPLACE(REPLACE(@ColVar4, ',', ''), '.', '.'), 
`dewpoint_f` = REPLACE(REPLACE(@ColVar5, ',', ''), '.', '.'), 
`humid_perc` = REPLACE(REPLACE(@ColVar6, ',', ''), '.', '.'), 
`windsp_mph` = REPLACE(REPLACE(@ColVar7, ',', ''), '.', '.'), 
`windir_deg` = REPLACE(REPLACE(@ColVar8, ',', ''), '.', '.'), 
`a_press_mbar` = REPLACE(REPLACE(@ColVar9, ',', ''), '.', '.'), 
`a_temp_f` = REPLACE(REPLACE(@ColVar10, ',', ''), '.', '.'), 
`a_dewp_f` = REPLACE(REPLACE(@ColVar11, ',', ''), '.', '.'), 
`a_humid_perc` = REPLACE(REPLACE(@ColVar12, ',', ''), '.', '.'), 
`a_windsp_mph` = REPLACE(REPLACE(@ColVar13, ',', ''), '.', '.'), 
`a_windir_deg` = REPLACE(REPLACE(@ColVar14, ',', ''), '.', '.');
/* 0 rows imported in 0.047 seconds. */
SHOW WARNINGS;

FROM
https://stackoverflow.com/questions/8163079/importing-a-csv-to-mysql-with-different-date-format


LOAD DATA LOW_PRIORITY LOCAL INFILE 
'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\testtxt.csv' 
INTO TABLE datetest
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
( @date_time_variable) -- read one of the field to variable
SET date_time_column = STR_TO_DATE(@date_time_variable, '%d-%b-%Y'); -- format this date-time variable


2018-11-28 20:18:00

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%Y-%m-%d');


CREATE TABLE `datetest` (
	`id` INT(11) auto_increment,
	`dt_utc` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COMMENT='The table for raw E1248 data'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
CHECKSUM=1
;

LOAD DATA LOW_PRIORITY 
LOCAL INFILE 'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\E1248_20181226_151309.csv' 
IGNORE 
INTO TABLE `weather`.`datetest` 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES (@ColVar0, `dt_utc`) 
SET `dt_utc` = REPLACE(REPLACE(@ColVar0, ',', ''), '.', '.');
/* 1 rows imported in 0.078 seconds. */
SHOW WARNINGS;

LOAD DATA LOCAL 
INFILE 'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\testtxt.csv' 
INTO TABLE `weather`.`datetest` 
CHARACTER SET 'utf8' 
FIELDS ESCAPED BY '\\' 
TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES (`dt_utc`); 