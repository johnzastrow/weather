/*
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

/*Table structure for table `E1248` */

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

/*Table structure for table `KPWM` */

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
COMMENT='The table for raw KPWM data';8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;