WITH RES AS
(
SELECT 
  CAST(measurement_time AS DATE) AS measurement_day,
  measurement_value,
  ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS RN
FROM
  measurements
)

SELECT
  measurement_day,
  SUM(measurement_value) FILTER(WHERE RN % 2 <> 0) AS odd_sum,
  SUM(measurement_value) FILTER(WHERE RN % 2 = 0) AS even_sum
FROM
  RES
GROUP BY measurement_day
