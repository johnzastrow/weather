DROP VIEW `weather`.`v_E1248_weekly`; 

CREATE VIEW `v_E1248_weekly` AS 
SELECT
  YEAR(`v_E1248_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_E1248_daily`.`d_utc`,0) AS `WEEKW`,
  CONCAT(YEAR(`v_E1248_daily`.`d_utc`),'-',WEEK(`v_E1248_daily`.`d_utc`,0)) AS `YEARWEEK`,
  MIN(`v_E1248_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_E1248_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_E1248_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_E1248_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_E1248_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  ROUND(MIN(`v_E1248_daily`.`temp_f_dmin`),2) AS `w_temp_f_min`,
  ROUND(MAX(`v_E1248_daily`.`temp_f_dmax`),2) AS `w_temp_f_max`,
  COUNT(`v_E1248_daily`.`recs`) AS `count_recs`,
  SUM(`v_E1248_daily`.`recs`) AS `sum_recs`
FROM `v_E1248_daily`
GROUP BY WEEK(`v_E1248_daily`.`d_utc`,0),YEAR(`v_E1248_daily`.`d_utc`)
ORDER BY YEAR(`v_E1248_daily`.`d_utc`),WEEK(`v_E1248_daily`.`d_utc`,0);

DROP VIEW `weather`.`v_E4229_weekly`; 

CREATE VIEW `v_E4229_weekly` AS 
SELECT
  YEAR(`v_E4229_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_E4229_daily`.`d_utc`,0) AS `WEEKW`,
  CONCAT(YEAR(`v_E4229_daily`.`d_utc`),'-',WEEK(`v_E4229_daily`.`d_utc`,0)) AS `YEARWEEK`,
  MIN(`v_E4229_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_E4229_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_E4229_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_E4229_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_E4229_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  ROUND(MIN(`v_E4229_daily`.`temp_f_dmin`),2) AS `w_temp_f_min`,
  ROUND(MAX(`v_E4229_daily`.`temp_f_dmax`),2) AS `w_temp_f_max`,
  COUNT(`v_E4229_daily`.`recs`) AS `count_recs`,
  SUM(`v_E4229_daily`.`recs`) AS `sum_recs`
FROM `v_E4229_daily`
GROUP BY WEEK(`v_E4229_daily`.`d_utc`,0),YEAR(`v_E4229_daily`.`d_utc`)
ORDER BY YEAR(`v_E4229_daily`.`d_utc`),WEEK(`v_E4229_daily`.`d_utc`,0);

DROP VIEW `weather`.`v_E4279_weekly`; 

CREATE VIEW `v_E4279_weekly` AS 
SELECT
  YEAR(`v_E4279_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_E4279_daily`.`d_utc`,0) AS `WEEKW`,
  CONCAT(YEAR(`v_E4279_daily`.`d_utc`),'-',WEEK(`v_E4279_daily`.`d_utc`,0)) AS `YEARWEEK`,
  MIN(`v_E4279_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_E4279_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_E4279_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_E4279_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_E4279_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  ROUND(MIN(`v_E4279_daily`.`temp_f_dmin`),2) AS `w_temp_f_min`,
  ROUND(MAX(`v_E4279_daily`.`temp_f_dmax`),2) AS `w_temp_f_max`,
  COUNT(`v_E4279_daily`.`recs`) AS `count_recs`,
  SUM(`v_E4279_daily`.`recs`) AS `sum_recs`
FROM `v_E4279_daily`
GROUP BY WEEK(`v_E4279_daily`.`d_utc`,0),YEAR(`v_E4279_daily`.`d_utc`)
ORDER BY YEAR(`v_E4279_daily`.`d_utc`),WEEK(`v_E4279_daily`.`d_utc`,0);

DROP VIEW `weather`.`v_KPWM_weekly`; 

CREATE VIEW `v_KPWM_weekly` AS 
SELECT
  YEAR(`v_KPWM_daily`.`d_utc`) AS `YEARY`,
  WEEK(`v_KPWM_daily`.`d_utc`,0) AS `WEEKW`,
  CONCAT(YEAR(`v_KPWM_daily`.`d_utc`),'-',WEEK(`v_KPWM_daily`.`d_utc`,0)) AS `YEARWEEK`,
  MIN(`v_KPWM_daily`.`d_utc`) AS `MIN_DAY`,
  ROUND(SUM(`v_KPWM_daily`.`hdd_d65`),2) AS `w_hdd_d65`,
  ROUND(SUM(`v_KPWM_daily`.`hdd_d70`),2) AS `w_hdd_d70`,
  ROUND(SUM(`v_KPWM_daily`.`windsp_mph_davg`),2) AS `w_windsp_sum`,
  ROUND(AVG(`v_KPWM_daily`.`temp_f_davg`),2) AS `w_temp_f_avg`,
  ROUND(MIN(`v_KPWM_daily`.`temp_f_dmin`),2) AS `w_temp_f_min`,
  ROUND(MAX(`v_KPWM_daily`.`temp_f_dmax`),2) AS `w_temp_f_max`,
  COUNT(`v_KPWM_daily`.`recs`) AS `count_recs`,
  SUM(`v_KPWM_daily`.`recs`) AS `sum_recs`
FROM `v_KPWM_daily`
GROUP BY WEEK(`v_KPWM_daily`.`d_utc`,0),YEAR(`v_KPWM_daily`.`d_utc`)
ORDER BY YEAR(`v_KPWM_daily`.`d_utc`),WEEK(`v_KPWM_daily`.`d_utc`,0);