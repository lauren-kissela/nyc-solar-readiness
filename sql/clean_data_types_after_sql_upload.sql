--clean up data types in SQL
CREATE TABLE `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned` AS
SELECT
 `City Council District`,
  `Agency`,
  `Site`,
  `site_address`,
  `Borough`,
  `Environmental Justice Area`,
  `Installed or Estimated Capacity _kW_`,
  `Installed or Estimated Capacity _mW_`,
  `Percentage of Max Peak Demand solar will cover`,
  `Estimated Annual Production _kW hours_`,
  `Estimated Annual Production _mW hours_`,
  `Percentage of Annual Electricity Consumption solar will supply`,
  CASE
    WHEN `Estimated annual emmissions reduction _MT CO2_` = 'Not    collected' THEN NULL
    ELSE SAFE_CAST(`Estimated annual emmissions reduction _MT CO2_` AS FLOAT64)
    END AS `Estimated annual emmissions reduction _MT CO2_`,
  CAST(`Estimated Social Cost of Carbon Value ___` AS FLOAT64) AS `Estimated Social Cost of Carbon Value ___`,
  CAST(`Estimated Annual Energy Savings ___` AS FLOAT64) AS `Estimated Annual Energy Savings ___`,
  CASE
    WHEN `Upfront Project Cost ___` = 'N/A' THEN NULL
    ELSE SAFE_CAST(`Upfront Project Cost ___` AS FLOAT64)
  END AS `Upfront Project Cost ___`,
   `Financing Mechanism`,
  `Status`,
  `Solar-Readiness Assessment undergone_`,
  CASE
    WHEN `Total Gross Square Footage _GSF_` = 'Unknown' THEN NULL
    ELSE SAFE_CAST(REPLACE(`Total Gross Square Footage _GSF_`, ',', '') AS FLOAT64) END AS `Total Gross Square Footage _GSF_`,
  `Roof Condition`,
  `Roof Age`,
  `Other Sustaibility Projects`,
  `Year of Report`,
  `Data Current as of`,
  `Postcode`,
  `Latitude`,
  `Longitude`,
  `Community Board`,
  `Census Tract`,
  `BIN`,
  `BBL`,
  `NTA`
FROM `nyc-trees-417421.solar_readiness_nyc.solar_readiness_clean`
