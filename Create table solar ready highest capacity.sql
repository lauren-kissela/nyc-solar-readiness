CREATE TABLE `nyc-trees-417421.solar_readiness_nyc.solar_ready_highest_capacity` AS
SELECT *
FROM `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`
WHERE Status = 'Solar Ready'
ORDER BY `Installed or Estimated Capacity _mW_` DESC