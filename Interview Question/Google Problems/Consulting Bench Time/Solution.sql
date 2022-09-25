
SELECT
  S.employee_id,
  365 - SUM(1+ (CE.end_date - CE.start_date)) AS bench_days
FROM
  staffing S JOIN consulting_engagements CE
  ON S.job_id = CE.job_id 
WHERE 
  S.is_consultant = 'true' 
GROUP BY  S.employee_id
