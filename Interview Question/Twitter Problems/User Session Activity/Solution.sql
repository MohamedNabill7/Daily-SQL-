WITH CTE AS
(
  SELECT 
    user_id, session_type, SUM(duration) AS TOTAL_DURATION
  FROM
    sessions
  WHERE DATE(start_date) BETWEEN '2022-01-01' AND '2022-02-01'
  GROUP BY user_id, session_type
)

SELECT 
  user_id,
  session_type,
  ranking
FROM 
  (
    SELECT
      *,
      DENSE_RANK() OVER(PARTITION BY session_type ORDER BY TOTAL_DURATION DESC) AS ranking
    FROM
      CTE
  ) AS RES
