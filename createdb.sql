create database weather;
use weather;
CREATE TABLE `E1248` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 CHECKSUM=1 
COMMENT='The table for raw E1248 data';



CREATE TABLE `KPWM` (
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
) ENGINE=InnoDB AUTO_INCREMENT=8192 DEFAULT CHARSET=utf8 CHECKSUM=1 
COMMENT='The table for raw KPWM data';