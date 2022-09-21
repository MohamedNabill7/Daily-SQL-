WITH RES AS
(
SELECT 
  category,	
  product,
  SUM(spend) AS total_spend
FROM
  product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = '2022'
GROUP BY product,category
ORDER BY category ASC, total_spend DESC
)

SELECT
  category,	
  product,
  total_spend
FROM(
      SELECT 
        *,
        DENSE_RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS DR
      FROM
        RES
    ) AS FINAL
WHERE DR <= 2
