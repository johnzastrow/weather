/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.3.11-MariaDB : Database - weather
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weather` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weather`;

/*Table structure for table `e1248` */

CREATE TABLE `e1248` (
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
) ENGINE=InnoDB AUTO_INCREMENT=74429 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';

/*Table structure for table `e1248_daily` */

CREATE TABLE `e1248_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `d_utc` date DEFAULT NULL,
  `temp_f_davg` double DEFAULT NULL,
  `hdd_d65` double DEFAULT NULL,
  `hdd_d70` double DEFAULT NULL,
  `temp_f_dmin` double DEFAULT NULL,
  `temp_f_dmax` double DEFAULT NULL,
  `windsp_mph_davg` double DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_d` (`d_utc`) COMMENT 'Keeps dupe data out'
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';

/*Table structure for table `e4229` */

CREATE TABLE `e4229` (
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
) ENGINE=InnoDB AUTO_INCREMENT=65536 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';

/*Table structure for table `e4279` */

CREATE TABLE `e4279` (
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
) ENGINE=InnoDB AUTO_INCREMENT=65536 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';

/*Table structure for table `kpwm` */

CREATE TABLE `kpwm` (
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
) ENGINE=InnoDB AUTO_INCREMENT=33704 DEFAULT CHARSET=utf8 CHECKSUM=1 COMMENT='The table for raw E1248 data';

/* Procedure structure for procedure `hunt` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hunt`()
begin
    DECLARE done int default false;
    DECLARE table_name CHAR(255);

    DECLARE cur1 cursor for SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_SCHEMA = "weather";
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    open cur1;
    
    myloop: loop
        fetch cur1 into table_name;
        if done then
            leave myloop;
        end if;
        -- select count(*) from `weather`.table_name;
        -- set @sql = CONCAT('select count(*) from `weather`.', table_name, ' where created_at >= '2012-10-01');
        SET @sql = CONCAT('select count(*) from `weather`.', table_name);
        prepare stmt from @sql;
        execute stmt;
        drop prepare stmt;
    end loop;

    close cur1;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
