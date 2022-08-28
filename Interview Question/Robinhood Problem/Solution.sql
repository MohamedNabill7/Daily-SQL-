select 
	U.city , count(U.city) as total_orders
from 
	users U right join trades T 
	on T.user_id = U.user_id
where
	T.status = 'Completed'
	
group by U.city

order by total_orders desc

limit 3 
