--some sites had values indicating that they were indeed solar ready in the GSF, roof condition, and roof age variables but were listed as not solar ready. identify these sites
SELECT *
FROM `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`
WHERE Status = 'Not solar ready' AND `Total Gross Square Footage _GSF_` >= 10000 AND `Roof Condition` = 'Good' AND (`Roof Age` = '2 to 4 years' OR `Roof Age` = '5 to 9 years' OR `Roof Age` = '< 2 years')
