CREATE TABLE `nyc-trees-417421.solar_readiness_nyc.eligible_for_roof_replacement` AS
SELECT *
FROM `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`
WHERE reason_not_solar_ready IN('Too old', 'Not in good condition', 'Too old and not in good condition')
ORDER BY `Total Gross Square Footage _GSF_` DESC