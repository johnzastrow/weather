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
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_dt` (`dt_utc`) COMMENT 'Keeps dupe data out'
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data'


DROP TABLE `weather`.`e1248_daily`; 

SELECT DATE(dt_utc), MIN(temp_f) AS temp_f_dmin, AVG(temp_f) AS temp_f_davg, 65 - AVG(temp_f) AS hdd_d65, MAX(temp_f) AS temp_f_dmax, COUNT(id) AS Recs FROM e1248 GROUP BY DATE(dt_utc);

 CREATE TABLE `e1248_daily` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`d_utc` DATE DEFAULT NULL,
`temp_f_davg` DOUBLE DEFAULT NULL,
	`hdd_d65` DOUBLE DEFAULT NULL,
	`hdd_d70` DOUBLE DEFAULT NULL,
`temp_f_dmin` DOUBLE DEFAULT NULL,
`temp_f_dmax` DOUBLE DEFAULT NULL,
`windsp_mph_davg` DOUBLE DEFAULT NULL,
`ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
 PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_d` (`d_utc`) COMMENT 'Keeps dupe data out'
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';



-- WORKS!
INSERT INTO e1248_daily (
  d_utc,
  temp_f_davg,
  hdd_d65,
  hdd_d70,
  temp_f_dmin,
  temp_f_dmax,
  windsp_mph_davg
)
  SELECT
    d_utc,
    temp_f_davg,
    hdd_d65,
    hdd_d70,
    temp_f_dmin,
    temp_f_dmax,
    windsp_mph_davg
  FROM
    (SELECT
      DATE(dt_utc) AS d_utc,
      AVG(temp_f) AS temp_f_davg,
      65 - AVG(temp_f) AS hdd_d65,
      70 - AVG(temp_f) AS hdd_d70,
      MIN(temp_f) AS temp_f_dmin,
      MAX(temp_f) AS temp_f_dmax,
      AVG(windsp_mph) AS windsp_mph_davg
    FROM
      e1248
    GROUP BY DATE(dt_utc)) temp1;


    DROP TABLE `weather`.`e1248_daily`; 

SELECT DATE(dt_utc), MIN(temp_f) AS temp_f_dmin, AVG(temp_f) AS temp_f_davg, 65 - AVG(temp_f) AS hdd_d65, MAX(temp_f) AS temp_f_dmax, COUNT(id) AS Recs FROM e1248 GROUP BY DATE(dt_utc);

 CREATE TABLE `e1248_daily` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`d_utc` DATE DEFAULT NULL,
`temp_f_davg` DOUBLE DEFAULT NULL,
	`hdd_d65` DOUBLE DEFAULT NULL,
	`hdd_d70` DOUBLE DEFAULT NULL,
`temp_f_dmin` DOUBLE DEFAULT NULL,
`temp_f_dmax` DOUBLE DEFAULT NULL,
`windsp_mph_davg` DOUBLE DEFAULT NULL,
`ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
 PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_d` (`d_utc`) COMMENT 'Keeps dupe data out'
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';



-- WORKS!
 INSERT INTO e1248_daily (
  d_utc,
  temp_f_davg,
  hdd_d65,
  hdd_d70,
  temp_f_dmin,
  temp_f_dmax,
  windsp_mph_davg
)
  SELECT
    d_utc,
    temp_f_davg,
    hdd_d65,
    hdd_d70,
    temp_f_dmin,
    temp_f_dmax,
    windsp_mph_davg
  FROM
    (SELECT
      DATE(dt_utc) AS d_utc,
      AVG(temp_f) AS temp_f_davg,
      65 - AVG(temp_f) AS hdd_d65,
      70 - AVG(temp_f) AS hdd_d70,
      MIN(temp_f) AS temp_f_dmin,
      MAX(temp_f) AS temp_f_dmax,
      AVG(windsp_mph) AS windsp_mph_davg
    FROM
      e1248
    GROUP BY DATE(dt_utc)) temp1;
    
    SELECT month_year FROM 
    SELECT CONCAT(MONTH(d_utc),'-',YEAR((d_utc))) AS month_year, SUM(hdd_d65) AS hdd_m65,SUM(hdd_d70) AS hdd_m70, COUNT(id) AS COUNT FROM  e1248_daily
    GROUP BY month_year temp3;


DROP PROCEDURE IF EXISTS filldates;
DELIMITER |
CREATE PROCEDURE filldates(dateStart DATE, dateEnd DATE)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO justdates (dates) VALUES (dateStart);
    SET dateStart = DATE_ADD(dateStart, INTERVAL 1 DAY);
  END WHILE;
END;
|
DELIMITER ;
CALL filldates('2015-01-01','2020-12-31');

OR


1. CREATE TABLE Days (day DATE PRIMARY KEY);

2. Fill Days with all the days you're looking for.

3.  mysql> INSERT INTO Days VALUES ('2011-01-01');
    mysql> SET @offset := 1;
    mysql> INSERT INTO Days SELECT day + INTERVAL @offset DAY FROM Days; SET @offset := @offset * 2;
Then up-arrow and repeat the INSERT as many times as needed. It doubles the number of rows each time, so you can get four month's worth of rows in seven INSERTs.

4. Do an exclusion join to find the dates for which there is no match in your reports table:

    SELECT d.day FROM Days d 
    LEFT OUTER JOIN Reports r ON d.day = DATE(r.reportdatetime) 
    WHERE d.day BETWEEN '2011-01-01' AND '2011-04-30' 
        AND r.reportdatetime IS NULL;`

Find missing days;

SELECT MIN(e1248_daily.`d_utc`), MAX(e1248_daily.`d_utc`) FROM e1248_daily;

SELECT
    `justdates`.`id`
    , `justdates`.`dates`
    , `e1248_daily`.`d_utc`
FROM
    `weather`.`e1248_daily`
    RIGHT OUTER JOIN `weather`.`justdates` 
        ON (`e1248_daily`.`d_utc` = `justdates`.`dates`)
          -- inject min and max from the table below
        WHERE dates > '2017-05-01' AND dates < '2019-01-14' AND d_utc IS NULL;
        or

SELECT
    `justdates`.`id`
    , `justdates`.`dates`
    , `e1248_daily`.`d_utc`
FROM
    `weather`.`e1248_daily`
    RIGHT OUTER JOIN `weather`.`justdates` 
        ON (`e1248_daily`.`d_utc` = `justdates`.`dates`)
        WHERE dates > '2017-05-01' AND dates < '2019-01-14';


