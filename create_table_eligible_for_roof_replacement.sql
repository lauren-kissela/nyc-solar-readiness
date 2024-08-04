--create a table of all non-solar ready sites that will be eligible for solar PV after roof replacement 
CREATE TABLE `nyc-trees-417421.solar_readiness_nyc.eligible_for_roof_replacement` AS
SELECT *
FROM `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`
  --to be eligible for solar, the roofs cannot be under 10000 sq ft, and must not already have a roof replacement in progress
WHERE reason_not_solar_ready IN('Too old', 'Not in good condition', 'Too old and not in good condition')
ORDER BY `Total Gross Square Footage _GSF_` DESC
