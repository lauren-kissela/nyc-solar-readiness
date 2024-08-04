--find out information about the sites that were misidentified as not solar ready
SELECT 
    --count under construction and actually solar ready sites
    COUNT(CASE WHEN reason_not_solar_ready IN ('Under construction', 'Actually solar ready') THEN site_address ELSE NULL END) AS additional_sites,
    --find additional square footage of misidentified sites
    SUM(CASE WHEN reason_not_solar_ready IN ('Under construction', 'Actually solar ready') THEN `Total Gross Square Footage _GSF_` ELSE 0 END) AS additional_gsf_solar_ready,
    --find the average MW capacity per site for sites where that data was collected
    AVG(CASE WHEN `Installed or Estimated Capacity _mW_` != 0 THEN `Installed or Estimated Capacity _mW_` ELSE NULL END) AS avg_mw_capacity_per_site,
    --multiply the number of new sites times the average MW capacity per site to get a rough estimate of additional MW capacity from the sites misidentified as not solar ready
    (COUNT(CASE WHEN reason_not_solar_ready IN ('Under construction', 'Actually solar ready') THEN site_address ELSE NULL END)) * AVG(CASE WHEN `Installed or Estimated Capacity _mW_` != 0 THEN `Installed or Estimated Capacity _mW_` ELSE NULL END) AS rough_estimate_additional_mw_capacity
FROM 
    `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`;
