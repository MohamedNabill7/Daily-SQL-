-- Part 1
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM 
  pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;

-----------------------------------------------------

--Part 2
SELECT 
  manufacturer,
  COUNT(1) AS drug_count,
  SUM(cogs - total_sales) AS total_loss
FROM
  pharmacy_sales
WHERE cogs > total_sales
GROUP BY 1
ORDER BY total_loss DESC 

-----------------------------------------------------

--Part 3

WITH CTE AS
(
SELECT 
  manufacturer,
  ROUND(SUM(total_sales),-6) AS sale
FROM  
  pharmacy_sales
GROUP BY 1  
ORDER BY sale DESC, manufacturer DESC
)
SELECT 
  manufacturer,
  CONCAT('$',LEFT(sale::VARCHAR,LENGTH(SALE:: VARCHAR)-6),' million') AS sale 
FROM CTE
