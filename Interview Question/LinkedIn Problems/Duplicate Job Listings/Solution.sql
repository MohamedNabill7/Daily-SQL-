WITH duplicate_job 
AS
(
SELECT 
  COUNT(*) AS duplicate_companies
FROM 
  job_listings
GROUP BY company_id , title
HAVING COUNT(*) > 1
)

SELECT 
  COUNT(duplicate_companies)
FROM 
  duplicate_job
