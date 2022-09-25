
SELECT
  advertiser_id,
  ROUND(CAST(SUM(revenue)/SUM(spend) AS DECIMAL),2) AS ROAS
FROM
  ad_campaigns
GROUP BY advertiser_id
ORDER BY advertiser_id ASC
