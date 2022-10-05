SELECT 
  user_id,
  spend,
  transaction_date
FROM
  (
  SELECT 
    *,
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date Asc) AS DR
  FROM
    transactions  
  ) AS transact

WHERE DR=3
  
