--fill in the column reason_not_solar_ready based on GSF, roof age, and roof condition
UPDATE `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned` 
SET reason_not_solar_ready = 
  CASE
    WHEN `Total Gross Square Footage _GSF_` < 10000 OR `Total Gross Square Footage _GSF_` IS NULL THEN 'Too small'
    WHEN `Roof Condition` != 'Good' AND `Total Gross Square Footage _GSF_` >= 10000 AND (`Roof Age` = '2 to 4 years' OR `Roof Age` = '5 to 9 years' OR `Roof Age` = '< 2 years') THEN 'Not in good condition'
    WHEN (`Roof Age` = '10 to 14 years' OR `Roof Age` = '15 to 19 years'  OR `Roof Age` = '> 20 years' OR `Roof Age` = 'Unknown') AND `Total Gross Square Footage _GSF_` >= 10000 AND `Roof Condition` = 'Good' THEN 'Too old'
    WHEN (`Roof Age` = '10 to 14 years' OR `Roof Age` = '15 to 19 years' OR `Roof Age` = '> 20 years' OR `Roof Age` = 'Unknown') AND `Roof Condition` != 'Good' AND `Total Gross Square Footage _GSF_` >= 10000 THEN 'Too old and not in good condition'
    WHEN (`Roof Age` = 'Under Construction' OR `Roof Condition` = 'Under Construction') AND `Total Gross Square Footage _GSF_` >= 10000 THEN 'Under construction'
    WHEN (`Roof Age` = '2 to 4 years' OR `Roof Age` = '5 to 9 years' OR `Roof Age` = '< 2 years') AND `Roof Condition` = 'Good' AND `Total Gross Square Footage _GSF_` >= 10000 THEN 'Actually solar ready'
END
WHERE Status = 'Not Solar Ready'
