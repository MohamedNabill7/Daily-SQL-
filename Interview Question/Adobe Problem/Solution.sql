SELECT 
  customer_id , SUM(
                    CASE
                      WHEN product = 'Photoshop' THEN 0
                      ELSE revenue
                    END) revenue
FROM
  adobe_transactions
WHERE customer_id IN (SELECT
                        customer_id
                      FROM
                        adobe_transactions
                      WHERE product ='Photoshop'
                      )
GROUP BY customer_id
ORDER BY customer_id ASC
