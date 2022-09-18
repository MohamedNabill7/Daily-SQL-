SELECT
  Profile.profile_id
FROM 
  personal_profiles Profile join company_pages Company
  ON Company.company_id = Profile.employer_id
WHERE 
  Profile.followers > Company.followers
ORDER BY Profile.profile_id
