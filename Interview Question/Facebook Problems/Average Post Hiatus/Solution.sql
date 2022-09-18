SELECT
  user_id,
  EXTRACT(DAY FROM(MAX(post_date) - MIN(post_date))) AS days_between
FROM
  posts
WHERE EXTRACT(year FROM post_date) = '2021'
GROUP BY user_id
HAVING COUNT(*) > 1
