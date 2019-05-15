DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_justmonths` AS (
SELECT DISTINCT
  `justdates`.`YEARMONTH` AS `YEARMONTHER`,
  YEAR(`justdates`.`dates`) AS `YEARM`,
  MONTH(`justdates`.`dates`) AS `MONTHM`,
  CONCAT(YEAR(`justdates`.`dates`),'-',MONTH(`justdates`.`dates`)) AS `YEARMONTH`,
  STR_TO_DATE(CONCAT(YEAR(`justdates`.`dates`),'-',MONTH(`justdates`.`dates`),'-02'),'%Y-%c-%d') AS `NORM_DATE`
FROM `justdates`)$$

DELIMITER ;

DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_monthly_electric` AS (
SELECT
  YEAR(`v_daily_electric`.`d_local`) AS `YEARY`,
  MONTH(`v_daily_electric`.`d_local`) AS `MONTHM`,
  STR_TO_DATE(CONCAT(YEAR(`v_daily_electric`.`d_local`),'-',MONTH(`v_daily_electric`.`d_local`),'-02'),'%Y-%c-%d') AS `NORM_DATE`,
  CONCAT(YEAR(`v_daily_electric`.`d_local`),'-',MONTH(`v_daily_electric`.`d_local`)) AS `YEARMONTH`,
  SUM(`v_daily_electric`.`d_kwh`) AS `m_kwh`,
  SUM(`v_daily_electric`.`recs`) AS `m_recs`
FROM `v_daily_electric`
GROUP BY MONTH(`v_daily_electric`.`d_local`),YEAR(`v_daily_electric`.`d_local`)
ORDER BY YEAR(`v_daily_electric`.`d_local`),MONTH(`v_daily_electric`.`d_local`))$$

DELIMITER ;

DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_monthly_utilities` AS (
SELECT `v_justmonths`.`YEARMONTH` AS `YEARMONTH`,`v_monthly_electric`.`m_kwh` AS `monthly_elec_use`,`v_monthly_gas`.`gas_usage` AS `monthly_gas_use`,IFNULL(`v_monthly_gas`.`gas_usage`,0) + IFNULL(`v_monthly_electric`.`m_kwh`,0) AS `monthly_tot_utils` FROM ((`v_justmonths` LEFT JOIN `v_monthly_electric` ON(`v_justmonths`.`YEARMONTH` = `v_monthly_electric`.`YEARMONTH`)) LEFT JOIN `v_monthly_gas` ON(`v_justmonths`.`YEARMONTH` = `v_monthly_gas`.`YEARMONTH`)))$$

DELIMITER ;


DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_monthly_gas` AS (
SELECT
  YEAR(`gas_bills`.`CurrentReadDate`) AS `YEARY`,
  MONTH(`gas_bills`.`CurrentReadDate`) AS `MONTHM`,
  CONCAT(YEAR(`gas_bills`.`CurrentReadDate`),'-',MONTH(`gas_bills`.`CurrentReadDate`)) AS `YEARMONTH`,
  STR_TO_DATE(CONCAT(YEAR(`gas_bills`.`CurrentReadDate`),'-',MONTH(`gas_bills`.`CurrentReadDate`),'-02'),'%Y-%c-%d') AS `NORM_DATE`,
  SUM(`gas_bills`.`ActualCCFUsage`) AS `gas_usage`
FROM `gas_bills`
GROUP BY MONTH(`gas_bills`.`CurrentReadDate`),YEAR(`gas_bills`.`CurrentReadDate`)
ORDER BY YEAR(`gas_bills`.`CurrentReadDate`),MONTH(`gas_bills`.`CurrentReadDate`))$$

DELIMITER ;
