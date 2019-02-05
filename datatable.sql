2018-11-28 20:18:00

SELECT DATE_FORMAT('2009-10-04 22:23:00', '%Y-%m-%d');

 SELECT month_year FROM 
    SELECT CONCAT(MONTH(d_utc),'-',YEAR((d_utc))) AS month_year, SUM(hdd_d65) AS hdd_m65,SUM(hdd_d70) AS hdd_m70, COUNT(id) AS COUNT FROM  E4229_daily
    -- GROUP BY month_year 
    temp3;

 CREATE TABLE `E1248_daily` (
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
 INSERT INTO E1248_daily (
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
      E1248
    GROUP BY DATE(dt_utc)) temp1;
    
    SELECT month_year FROM 
    SELECT CONCAT(MONTH(d_utc),'-',YEAR((d_utc))) AS month_year, SUM(hdd_d65) AS hdd_m65,SUM(hdd_d70) AS hdd_m70, COUNT(id) AS COUNT FROM  e1248_daily
    GROUP BY month_year temp3;


 CREATE TABLE `E4229_daily` (
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
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E4229 data';



-- WORKS!
 INSERT INTO E4229_daily (
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
      E4229
    GROUP BY DATE(dt_utc)) temp1;
    

    CREATE TABLE `E4279_daily` (
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
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E4279 data';



-- WORKS!
 INSERT INTO E4279_daily (
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
      E4279
    GROUP BY DATE(dt_utc)) temp1;

    CREATE TABLE `KPWM_daily` (
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

CREATE TABLE `justdates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dates` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2193 DEFAULT CHARSET=utf8

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

# gives date range to look for data
SELECT MIN(e1248_daily.`d_utc`), MAX(e1248_daily.`d_utc`) FROM e1248_daily;


# Shows records where data is missing
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
        

# Shows all records including holes
SELECT
    `justdates`.`id`
    , `justdates`.`dates`
    , `e1248_daily`.`d_utc`
FROM
    `weather`.`e1248_daily`
    RIGHT OUTER JOIN `weather`.`justdates` 
        ON (`e1248_daily`.`d_utc` = `justdates`.`dates`)
        WHERE dates > '2017-05-01' AND dates < '2019-01-14';


-- Create a monthly table of aggregates
CREATE TABLE e1248_monthly AS SELECT
    YEAR (`d_utc`) AS YEARY
    , MONTH(`d_utc`) AS MONTHM
    , SUM(`hdd_d65`)
    , SUM(`hdd_d70`)
    , SUM(`windsp_mph_davg`)
    ,COUNT(id)
FROM
    `weather`.`e1248_daily`
GROUP BY MONTH(`d_utc`), YEAR(`d_utc`)
-- order by YEAR(`d_utc`), MONTH(`d_utc`) 
ORDER BY YEARY, MONTHM
;
