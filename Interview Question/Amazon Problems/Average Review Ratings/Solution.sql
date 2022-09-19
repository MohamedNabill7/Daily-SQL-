SELECT
  EXTRACT(Month From submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars),2) AS avg_stars
FROM
  reviews
GROUP BY 
  mth,
  product
ORDER BY 
   mth,
  product
