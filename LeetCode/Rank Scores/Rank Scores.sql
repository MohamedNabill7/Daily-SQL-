
select 
	score,
	Dense_Rank() over(order by score desc) as Rank 
from 
	Scores 
