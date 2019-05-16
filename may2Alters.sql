
CREATE ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_justweeks` AS (
select distinct
  `justdates`.`YEARMONTH` AS `YEARMONTHER`,
  year(`justdates`.`dates`) AS `YEARM`,
  month(`justdates`.`dates`) AS `MONTHM`,
  str_to_date(concat(year(`justdates`.`dates`),'-',month(`justdates`.`dates`),'-02'),'%Y-%c-%d') AS `NORM_DATE`,
  week(`justdates`.`dates`,0) AS `WEEKW`,
  min(`justdates`.`dates`) AS `MIN_DAY`
from `justdates`
group by week(`justdates`.`dates`,0),year(`justdates`.`dates`)
order by year(`justdates`.`dates`),week(`justdates`.`dates`,0))


DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`jcz`@`%` SQL SECURITY DEFINER VIEW `v_justweeks` AS (
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
    SUM(`v_e1248_weekly`.`w_hdd_d65`) AS `e1248_sum_hdd65`
    , AVG(`v_e1248_weekly`.`w_temp_f_avg`) AS `e1248_avg_degf`
    , SUM(`v_e1248_weekly`.`count_recs`) AS `e1248_sum_recs`
    , `v_justweeks`.`MIN_DAY`
    , sum(`v_e4279_weekly`.`w_hdd_d65`) AS `e4279_sum_hdd65`
    , avg(`v_e4279_weekly`.`w_temp_f_avg`) AS `e4279_avg_degf`
    , sum(`v_e4279_weekly`.`count_recs`) AS `e4279_sum_recs`
    , sum(`v_e4229_weekly`.`w_hdd_d65`) AS `e4229_sum_hdd65`
    , avg(`v_e4229_weekly`.`w_temp_f_avg`) AS `e4229_avg_degf`
    , sum(`v_e4229_weekly`.`count_recs`) AS `e4229_sum_recs`
    , sum(`v_kpwm_weekly`.`w_hdd_d65`) AS `kpwm_sum_hdd65`
    , avg(`v_kpwm_weekly`.`w_temp_f_avg`) AS `kpwm_avg_degf`
    , sum(`v_kpwm_weekly`.`count_recs`) AS `kpwm_sum_recs`
FROM
    `weather`.`v_e1248_weekly`
    LEFT JOIN `weather`.`v_justweeks` 
        ON (`v_e1248_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
    LEFT JOIN `weather`.`v_e4279_weekly` 
        ON (`v_e4279_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
    LEFT JOIN `weather`.`v_e4229_weekly` 
        ON (`v_e4229_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
    LEFT JOIN `weather`.`v_kpwm_weekly` 
        ON (`v_kpwm_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`)
GROUP BY `v_justweeks`.`MIN_DAY`
ORDER BY `v_justweeks`.`MIN_DAY` ASC;


CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_weekly_compare` AS (
select
  `v_justweeks`.`MIN_DAY` AS `MIN_DAY`,
  sum(`v_e1248_weekly`.`w_hdd_d65`) AS `e1248_sum_hdd65`,
  avg(`v_e1248_weekly`.`w_temp_f_avg`) AS `e1248_avg_degf`,
  sum(`v_e1248_weekly`.`count_recs`) AS `e1248_sum_recs`,
  sum(`v_e4279_weekly`.`w_hdd_d65`) AS `e4279_sum_hdd65`,
  avg(`v_e4279_weekly`.`w_temp_f_avg`) AS `e4279_avg_degf`,
  sum(`v_e4279_weekly`.`count_recs`) AS `e4279_sum_recs`,
  sum(`v_e4229_weekly`.`w_hdd_d65`) AS `e4229_sum_hdd65`,
  avg(`v_e4229_weekly`.`w_temp_f_avg`) AS `e4229_avg_degf`,
  sum(`v_e4229_weekly`.`count_recs`) AS `e4229_sum_recs`,
  sum(`v_kpwm_weekly`.`w_hdd_d65`) AS `kpwm_sum_hdd65`,
  avg(`v_kpwm_weekly`.`w_temp_f_avg`) AS `kpwm_avg_degf`,
  sum(`v_kpwm_weekly`.`count_recs`) AS `kpwm_sum_recs`
from (`v_kpwm_weekly`
   left join (`v_e4229_weekly`
              left join (`v_e4279_weekly`
                         left join (`v_justweeks`
                                    left join `v_e1248_weekly`
                                      on (`v_e1248_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
                           on (`v_e4279_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
                on (`v_e4229_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
     on (`v_kpwm_weekly`.`MIN_DAY` = `v_justweeks`.`MIN_DAY`))
group by `v_justweeks`.`MIN_DAY`
order by `v_justweeks`.`MIN_DAY`)