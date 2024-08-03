SELECT 
    COUNT(CASE WHEN reason_not_solar_ready IN ('Under construction', 'Actually solar ready') THEN site_address ELSE NULL END) AS additional_sites,
    SUM(CASE WHEN reason_not_solar_ready IN ('Under construction', 'Actually solar ready') THEN `Total Gross Square Footage _GSF_` ELSE 0 END) AS additional_gsf_solar_ready,
    AVG(CASE WHEN `Installed or Estimated Capacity _mW_` != 0 THEN `Installed or Estimated Capacity _mW_` ELSE NULL END) AS avg_mw_capacity_per_site,
    (COUNT(CASE WHEN reason_not_solar_ready IN ('Under construction', 'Actually solar ready') THEN site_address ELSE NULL END)) * AVG(CASE WHEN `Installed or Estimated Capacity _mW_` != 0 THEN `Installed or Estimated Capacity _mW_` ELSE NULL END) AS rough_estimate_additional_mw_capacity
FROM 
    `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`;