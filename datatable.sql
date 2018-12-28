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




2018-11-28 20:18:00

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%Y-%m-%d');


LOAD DATA LOCAL 
INFILE 'C:\\Users\\jzastrow\\Documents\\GitHub\\weather\\E1248_20181226_151309.csv' 
IGNORE INTO TABLE `weather`.`table_e1248` 
-- ignore lets the import skip dupes rows 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES (`dt_utc`,`pressure_mbar`,`pressure_mbar`,`temp_f`,`dewpoint_f`,`humid_perc`,`windsp_mph`,`windir_deg`,`a_press_mbar`,`a_temp_f`,`a_dewp_f`,`a_humid_perc`,`a_windsp_mph`,`a_windir_deg`
); 

create database weather;
use weather;
CREATE TABLE `table_e1248` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_utc` datetime DEFAULT NULL,
  `pressure_mbar` double DEFAULT NULL,
  `temp_f` double DEFAULT NULL,
  `dewpoint_f` double DEFAULT NULL,
  `humid_perc` double DEFAULT NULL,
  `windsp_mph` double DEFAULT NULL,
  `windir_deg` double DEFAULT NULL,
  `a_press_mbar` double DEFAULT NULL,
  `a_temp_f` double DEFAULT NULL,
  `a_dewp_f` double DEFAULT NULL,
  `a_humid_perc` double DEFAULT NULL,
  `a_windsp_mph` double DEFAULT NULL,
  `a_windir_deg` double DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data'


CREATE TABLE `table_e1248` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_utc` datetime DEFAULT NULL,
  `pressure_mbar` double DEFAULT NULL,
  `temp_f` double DEFAULT NULL,
  `dewpoint_f` double DEFAULT NULL,
  `humid_perc` double DEFAULT NULL,
  `windsp_mph` double DEFAULT NULL,
  `windir_deg` double DEFAULT NULL,
  `a_press_mbar` double DEFAULT NULL,
  `a_temp_f` double DEFAULT NULL,
  `a_dewp_f` double DEFAULT NULL,
  `a_humid_perc` double DEFAULT NULL,
  `a_windsp_mph` double DEFAULT NULL,
  `a_windir_deg` double DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_dt` (`dt_utc`) COMMENT 'Keeps dupe data out'
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data'