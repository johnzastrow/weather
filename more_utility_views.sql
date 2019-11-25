
CREATE VIEW `v_weekly_electric_use` AS (
select
  cast(min(`electric_use`.`Intervaldatetime`) as date) AS `MIN_DAY`,
  year(`electric_use`.`Intervaldatetime`) AS `YEARM`,
  month(`electric_use`.`Intervaldatetime`) AS `MONTHM`,
  str_to_date(concat(year(`electric_use`.`Intervaldatetime`),'-',month(`electric_use`.`Intervaldatetime`),'-02'),'%Y-%c-%d') AS `NORM_DATE`,
  week(`electric_use`.`Intervaldatetime`,0) AS `WEEKW`,
  concat(year(`electric_use`.`Intervaldatetime`),'-W',week(`electric_use`.`Intervaldatetime`,0)) AS `WEEKR`,
  sum(`electric_use`.`kwh`) AS `SUM_KWH`,
  count(`electric_use`.`id`) AS `RECS`
from `electric_use`
group by concat(year(`electric_use`.`Intervaldatetime`),'-W',week(`electric_use`.`Intervaldatetime`,0))
order by cast(min(`electric_use`.`Intervaldatetime`)as date))