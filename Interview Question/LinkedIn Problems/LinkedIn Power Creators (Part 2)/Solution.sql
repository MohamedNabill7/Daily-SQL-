WITH RES AS
(
SELECT
  PP.profile_id,
  SUM(PP.followers) as Personal_Followers,
  SUM(CP.followers) as Company_Followers
FROM
  personal_profiles PP JOIN employee_company EC
  ON PP.profile_id = EC.personal_profile_id
  JOIN company_pages CP ON EC.company_id = CP.company_id
GROUP BY PP.profile_id
HAVING SUM(PP.followers) > SUM(CP.followers)
ORDER BY PP.profile_id
)

SELECT 
  profile_id
FROM
  RES
