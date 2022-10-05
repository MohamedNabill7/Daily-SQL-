SELECT
  order_date,
  product_type,
  SUM(quantity) OVER(PARTITION BY product_type ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_purchased
FROM
  total_trans
ORDER BY order_date
