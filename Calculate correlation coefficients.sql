SELECT
  CORR(IF(Status = 'Completed', `Upfront Project Cost ___`, NULL), 
       IF(Status = 'Completed', `Estimated Annual Energy Savings ___`, NULL)) AS cost_savings_correlation_coefficient,
  CORR(IF(Status = 'Completed', `Installed or Estimated Capacity _mW_`, NULL), 
       IF(Status = 'Completed', `Upfront Project Cost ___`, NULL)) AS capacity_cost_correlation_coefficient,
  CORR(IF(Status = 'Completed' AND `Upfront Project Cost ___` != 0, `Installed or Estimated Capacity _mW_`, NULL), 
       IF(Status = 'Completed' AND `Upfront Project Cost ___` != 0, `Upfront Project Cost ___`, NULL)) AS capacity_costnot0_correlation_coefficient,
  CORR(IF(Status = 'Solar Ready', `Installed or Estimated Capacity _mW_`, NULL), 
       IF(Status = 'Solar Ready', `Total Gross Square Footage _GSF_`, NULL)) AS capacity_gsf_correlation_coefficient,
  CORR(IF(Status != 'Not Solar Ready', `Installed or Estimated Capacity _mW_`, NULL), 
       IF(Status != 'Not Solar Ready', `Estimated annual emmissions reduction _MT CO2_`, NULL)) AS capacity_emreduction_correlation_coefficient,
  CORR(IF(Status = 'Solar Ready' OR Status = 'In Progress', `Installed or Estimated Capacity _mW_`, NULL), 
       IF(Status = 'Solar Ready' OR Status = 'In Progress', `Estimated Annual Energy Savings ___`, NULL)) AS capacity_savings_correlation_coefficient,
FROM
  `nyc-trees-417421.solar_readiness_nyc.solar_readiness_cleaned`;