SELECT 
  ROUND(100.0 *(SELECT
                  COUNT(DISTINCT(S.user_id))
                FROM
                  signups S LEFT JOIN user_purchases U ON S.user_id = U.user_id
                WHERE
                  (date(u.purchase_date) - date(s.signup_date)) < 7) 
              / COUNT(user_id), 2) AS single_purchase_pct
FROM
  signups
