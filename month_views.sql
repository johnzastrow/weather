DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_E1248_monthly` AS 
SELECT
  YEAR(`v_E1248_daily`.`d_utc`) AS `YEARY`,
  MONTH(`v_E1248_daily`.`d_utc`) AS `MONTHM`,
  CONCAT(YEAR(`v_E1248_daily`.`d_utc`),'-',MONTH(`v_E1248_daily`.`d_utc`)) AS `YEARMONTH`,
    MIN(`v_E1248_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_E1248_daily`.`hdd_d65`),2) AS `m_hdd_d65`,
  ROUND(SUM(`v_E1248_daily`.`hdd_d70`),2) AS `m_hdd_d70`,
  ROUND(SUM(`v_E1248_daily`.`windsp_mph_davg`),2) AS `m_windsp_davg`,
  ROUND(AVG(`v_E1248_daily`.`temp_f_davg`),2) AS `m_temp_f_avg`,
  COUNT(`v_E1248_daily`.`recs`) AS `count_recs`
FROM `v_E1248_daily`
GROUP BY MONTH(`v_E1248_daily`.`d_utc`),YEAR(`v_E1248_daily`.`d_utc`)
ORDER BY YEAR(`v_E1248_daily`.`d_utc`),MONTH(`v_E1248_daily`.`d_utc`)$$

DELIMITER ;

DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_E4229_monthly` AS 
SELECT
  YEAR(`v_E4229_daily`.`d_utc`) AS `YEARY`,
  MONTH(`v_E4229_daily`.`d_utc`) AS `MONTHM`,
  CONCAT(YEAR(`v_E4229_daily`.`d_utc`),'-',MONTH(`v_E4229_daily`.`d_utc`)) AS `YEARMONTH`,
    MIN(`v_E4229_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_E4229_daily`.`hdd_d65`),2) AS `m_hdd_d65`,
  ROUND(SUM(`v_E4229_daily`.`hdd_d70`),2) AS `m_hdd_d70`,
  ROUND(SUM(`v_E4229_daily`.`windsp_mph_davg`),2) AS `m_windsp_davg`,
  ROUND(AVG(`v_E4229_daily`.`temp_f_davg`),2) AS `m_temp_f_avg`,
  COUNT(`v_E4229_daily`.`recs`) AS `count_recs`
FROM `v_E4229_daily`
GROUP BY MONTH(`v_E4229_daily`.`d_utc`),YEAR(`v_E4229_daily`.`d_utc`)
ORDER BY YEAR(`v_E4229_daily`.`d_utc`),MONTH(`v_E4229_daily`.`d_utc`)$$

DELIMITER ;

DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_E4279_monthly` AS 
SELECT
  YEAR(`v_E4279_daily`.`d_utc`) AS `YEARY`,
  MONTH(`v_E4279_daily`.`d_utc`) AS `MONTHM`,
  CONCAT(YEAR(`v_E4279_daily`.`d_utc`),'-',MONTH(`v_E4279_daily`.`d_utc`)) AS `YEARMONTH`,
    MIN(`v_E4279_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_E4279_daily`.`hdd_d65`),2) AS `m_hdd_d65`,
  ROUND(SUM(`v_E4279_daily`.`hdd_d70`),2) AS `m_hdd_d70`,
  ROUND(SUM(`v_E4279_daily`.`windsp_mph_davg`),2) AS `m_windsp_davg`,
  ROUND(AVG(`v_E4279_daily`.`temp_f_davg`),2) AS `m_temp_f_avg`,
  COUNT(`v_E4279_daily`.`recs`) AS `count_recs`
FROM `v_E4279_daily`
GROUP BY MONTH(`v_E4279_daily`.`d_utc`),YEAR(`v_E4279_daily`.`d_utc`)
ORDER BY YEAR(`v_E4279_daily`.`d_utc`),MONTH(`v_E4279_daily`.`d_utc`)$$

DELIMITER ;

DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_KPWM_monthly` AS 
SELECT
  YEAR(`v_KPWM_daily`.`d_utc`) AS `YEARY`,
  MONTH(`v_KPWM_daily`.`d_utc`) AS `MONTHM`,
  CONCAT(YEAR(`v_KPWM_daily`.`d_utc`),'-',MONTH(`v_KPWM_daily`.`d_utc`)) AS `YEARMONTH`,
    MIN(`v_KPWM_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_KPWM_daily`.`hdd_d65`),2) AS `m_hdd_d65`,
  ROUND(SUM(`v_KPWM_daily`.`hdd_d70`),2) AS `m_hdd_d70`,
  ROUND(SUM(`v_KPWM_daily`.`windsp_mph_davg`),2) AS `m_windsp_davg`,
  ROUND(AVG(`v_KPWM_daily`.`temp_f_davg`),2) AS `m_temp_f_avg`,
  COUNT(`v_KPWM_daily`.`recs`) AS `count_recs`
FROM `v_KPWM_daily`
GROUP BY MONTH(`v_KPWM_daily`.`d_utc`),YEAR(`v_KPWM_daily`.`d_utc`)
ORDER BY YEAR(`v_KPWM_daily`.`d_utc`),MONTH(`v_KPWM_daily`.`d_utc`)$$

DELIMITER ;
