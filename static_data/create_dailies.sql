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
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw KPWM data';



-- WORKS!
 INSERT INTO KPWM_daily (
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
      KPWM
    GROUP BY DATE(dt_utc)) temp1;
   