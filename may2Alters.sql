
CREATE  VIEW `v_justweeks` AS (
select distinct
  `justdates`.`YEARMONTH` AS `YEARMONTHER`,
  year(`justdates`.`dates`) AS `YEARM`,
  month(`justdates`.`dates`) AS `MONTHM`,
  str_to_date(concat(year(`justdates`.`dates`),'-',month(`justdates`.`dates`),'-02'),'%Y-%c-%d') AS `NORM_DATE`,
  week(`justdates`.`dates`,0) AS `WEEKW`,
  min(`justdates`.`dates`) AS `MIN_DAY`
from `justdates`
group by week(`justdates`.`dates`,0),year(`justdates`.`dates`)
order by year(`justdates`.`dates`),week(`justdates`.`dates`,0));


DELIMITER $$

ALTER   VIEW `v_justweeks` AS (
SELECT DISTINCT
  `justdates`.`YEARMONTH` AS `YEARMONTHER`,
  YEAR(`justdates`.`dates`) AS `YEARM`,
  MONTH(`justdates`.`dates`) AS `MONTHM`,
  STR_TO_DATE(CONCAT(YEAR(`justdates`.`dates`),'-',MONTH(`justdates`.`dates`),'-02'),'%Y-%c-%d') AS `NORM_DATE`,
  WEEK(`justdates`.`dates`,0) AS `WEEKW`,
  MIN(`justdates`.`dates`) AS `MIN_DAY`
  
FROM `justdates`
GROUP BY WEEK(`justdates`.`dates`,0),YEAR(`justdates`.`dates`)
ORDER BY YEAR(`justdates`.`dates`),WEEK(`justdates`.`dates`,0))$$

DELIMITER ;


SELECT
    SUM(`v_E1248_weekly`.`w_hdd_d65`) AS `e1248_sum_hdd65`
    , AVG(`v_E1248_weekly`.`w_temp_f_avg`) AS `e1248_avg_degf`
    , SUM(`v_E1248_weekly`.`count_recs`) AS `e1248_sum_recs`
    , `v_justweeks`.`MIN_DAY`
    , sum(`v_E4279_weekly`.`w_hdd_d65`) AS `e4279_sum_hdd65`
    , avg(`v_E4279_weekly`.`w_temp_f_avg`) AS `e4279_avg_degf`
    , sum(`v_E4279_weekly`.`count_recs`) AS `e4279_sum_recs`
    , sum(`v_E4229_weekly`.`w_hdd_d65`) AS `e4229_sum_hdd65`
    , avg(`v_E4229_weekly`.`w_temp_f_avg`) AS `e4229_avg_degf`
    , sum(`v_E4229_weekly`.`count_recs`) AS `e4229_sum_recs`
    , sum(`v_KPWM_weekly`.`w_hdd_d65`) AS `kpwm_sum_hdd65`
    , avg(`v_KPWM_weekly`.`w_temp_f_avg`) AS `kpwm_avg_degf`
    , sum(`v_KPWM_weekly`.`count_recs`) AS `kpwm_sum_recs`
FROM
    `weather`.`v_E1248_weekly`
    LEFT JOIN `weather`.`v_justweeks` 
        ON (`v_E1248_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
    LEFT JOIN `weather`.`v_E4279_weekly` 
        ON (`v_E4279_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
    LEFT JOIN `weather`.`v_E4229_weekly` 
        ON (`v_E4229_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
    LEFT JOIN `weather`.`v_KPWM_weekly` 
        ON (`v_KPWM_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
GROUP BY `v_justweeks`.`MIN_DAY`
ORDER BY `v_justweeks`.`MIN_DAY` ASC;


CREATE VIEW `v_weekly_compare` AS (
SELECT
  `v_justweeks`.`MIN_DAY` AS `MIN_DAY`,
  SUM(`v_E1248_weekly`.`w_hdd_d65`) AS `e1248_sum_hdd65`,
  AVG(`v_E1248_weekly`.`w_temp_f_avg`) AS `e1248_avg_degf`,
  SUM(`v_E1248_weekly`.`count_recs`) AS `e1248_sum_recs`,
  SUM(`v_E4279_weekly`.`w_hdd_d65`) AS `e4279_sum_hdd65`,
  AVG(`v_E4279_weekly`.`w_temp_f_avg`) AS `e4279_avg_degf`,
  SUM(`v_E4279_weekly`.`count_recs`) AS `e4279_sum_recs`,
  SUM(`v_E4229_weekly`.`w_hdd_d65`) AS `e4229_sum_hdd65`,
  AVG(`v_E4229_weekly`.`w_temp_f_avg`) AS `e4229_avg_degf`,
  SUM(`v_E4229_weekly`.`count_recs`) AS `e4229_sum_recs`,
  SUM(`v_KPWM_weekly`.`w_hdd_d65`) AS `kpwm_sum_hdd65`,
  AVG(`v_KPWM_weekly`.`w_temp_f_avg`) AS `kpwm_avg_degf`,
  SUM(`v_KPWM_weekly`.`count_recs`) AS `kpwm_sum_recs`
FROM (`v_KPWM_weekly`
   LEFT JOIN (`v_E4229_weekly`
              LEFT JOIN (`v_E4279_weekly`
                         LEFT JOIN (`v_justweeks`
                                    LEFT JOIN `v_E1248_weekly`
                                      ON (`v_E1248_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
                           ON (`v_E4279_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
                ON (`v_E4229_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
     ON (`v_KPWM_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
GROUP BY `v_justweeks`.`MIN_DAY`
ORDER BY `v_justweeks`.`MIN_DAY`);


CREATE 
    VIEW `weather`.`v_annual_electric_bill` 
    AS
(
SELECT
    YEAR(`PayDate`) AS YEAR
    , ROUND(SUM(`Amount`),2) AS sum_amount
FROM
    `weather`.`electric_bills`
GROUP BY `year`

);

CREATE
    VIEW `weather`.`v_annual_gas` 
    AS
(

SELECT
   YEAR(`DateBill`) AS YEAR
    , ROUND(SUM(`ThermsUsed`),2) AS annual_therms
    , ROUND(SUM(`ActualGasUsage`),2) AS annual_cost
FROM
    `weather`.`gas_bills`
GROUP BY `year`
);


CREATE
    VIEW `weather`.`v_E4229_annual` 
    AS
(

SELECT
    `YEARY`
    , SUM(`w_hdd_d65`) AS sum_hdd65
    , SUM(`w_hdd_d70`) AS sum_hdd70
    , SUM(`w_windsp_sum`) AS sum_wind
    , ROUND(AVG(`w_temp_f_avg`),2) AS avg_temp
    , SUM(`count_recs`) AS sum_recs
FROM
    `weather`.`v_E4229_weekly`
GROUP BY `YEARY`

);