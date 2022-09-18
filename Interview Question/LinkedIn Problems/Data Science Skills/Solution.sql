SELECT  
  candidate_id
FROM
  candidates
GROUP BY candidate_id
HAVING sum(CASE
        when skill IN ('Python', 'Tableau', 'PostgreSQL') THEN 1
        ELSE 0
      END) >= 3
ORDER BY candidate_id ASC
