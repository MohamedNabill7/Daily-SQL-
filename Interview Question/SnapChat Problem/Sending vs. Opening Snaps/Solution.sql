WITH TAB AS 
(
  SELECT
    age_bucket,
    activity_type,
    time_spent,
    SUM(time_spent) OVER (PARTITION BY age_bucket) AS TOTAL

  FROM
    activities A JOIN age_breakdown B USING(user_id)
  WHERE activity_type = 'open' or activity_type = 'send'
)

SELECT 
  age_bucket,
  ROUND(100.0*(SUM(time_spent/TOTAL) FILTER(WHERE activity_type='send')),2) AS send_perc,
  ROUND(100.0*(SUM(time_spent/TOTAL) FILTER(WHERE activity_type='open')),2) AS open_perc
FROM 
  TAB
GROUP BY age_bucket
