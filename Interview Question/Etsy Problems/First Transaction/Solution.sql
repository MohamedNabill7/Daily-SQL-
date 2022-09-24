SELECT
  COUNT(user_id) users
FROM
  (
    SELECT
      *,
      ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) RN
    FROM
      user_transactions
    
  ) AS RES
WHERE RN = 1 AND spend >= 50.00
