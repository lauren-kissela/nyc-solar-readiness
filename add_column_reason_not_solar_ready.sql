--add a column to list the reason a site is not solar ready
ALTER TABLE `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`
ADD COLUMN reason_not_solar_ready STRING
