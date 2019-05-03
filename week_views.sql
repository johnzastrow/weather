CREATE ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_e1248_weekly` AS 
SELECT
  YEAR(`v_e1248_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_e1248_daily`.`d_utc`) AS `WEEKW`,
  CONCAT(YEAR(`v_e1248_daily`.`d_utc`),'-',WEEK(`v_e1248_daily`.`d_utc`)) AS `YEARWEEK`,
  MIN(`v_e1248_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_e1248_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_e1248_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_e1248_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_e1248_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  COUNT(`v_e1248_daily`.`recs`) AS `count_recs`
FROM `v_e1248_daily`
GROUP BY WEEK(`v_e1248_daily`.`d_utc`),YEAR(`v_e1248_daily`.`d_utc`)
ORDER BY YEAR(`v_e1248_daily`.`d_utc`),WEEK(`v_e1248_daily`.`d_utc`)

CREATE ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_e4229_weekly` AS 
SELECT
  YEAR(`v_e4229_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_e4229_daily`.`d_utc`) AS `WEEKW`,
  CONCAT(YEAR(`v_e4229_daily`.`d_utc`),'-',WEEK(`v_e4229_daily`.`d_utc`)) AS `YEARWEEK`,
  MIN(`v_e4229_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_e4229_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_e4229_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_e4229_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_e4229_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  COUNT(`v_e4229_daily`.`recs`) AS `count_recs`
FROM `v_e4229_daily`
GROUP BY WEEK(`v_e4229_daily`.`d_utc`),YEAR(`v_e4229_daily`.`d_utc`)
ORDER BY YEAR(`v_e4229_daily`.`d_utc`),WEEK(`v_e4229_daily`.`d_utc`)

CREATE ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_e4279_weekly` AS 
SELECT
  YEAR(`v_e4279_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_e4279_daily`.`d_utc`) AS `WEEKW`,
  CONCAT(YEAR(`v_e4279_daily`.`d_utc`),'-',WEEK(`v_e4279_daily`.`d_utc`)) AS `YEARWEEK`,
  MIN(`v_e4279_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_e4279_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_e4279_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_e4279_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_e4279_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  COUNT(`v_e4279_daily`.`recs`) AS `count_recs`
FROM `v_e4279_daily`
GROUP BY WEEK(`v_e4279_daily`.`d_utc`),YEAR(`v_e4279_daily`.`d_utc`)
ORDER BY YEAR(`v_e4279_daily`.`d_utc`),WEEK(`v_e4279_daily`.`d_utc`)

CREATE ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_kpwm_weekly` AS 
SELECT
  YEAR(`v_kpwm_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_kpwm_daily`.`d_utc`) AS `WEEKW`,
  CONCAT(YEAR(`v_kpwm_daily`.`d_utc`),'-',WEEK(`v_kpwm_daily`.`d_utc`)) AS `YEARWEEK`,
  MIN(`v_kpwm_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_kpwm_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_kpwm_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_kpwm_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_kpwm_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  COUNT(`v_kpwm_daily`.`recs`) AS `count_recs`
FROM `v_kpwm_daily`
GROUP BY WEEK(`v_kpwm_daily`.`d_utc`),YEAR(`v_kpwm_daily`.`d_utc`)
ORDER BY YEAR(`v_kpwm_daily`.`d_utc`),WEEK(`v_kpwm_daily`.`d_utc`)