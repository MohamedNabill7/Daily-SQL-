select
	U.user_id as buyer_id ,
	U.join_date ,
	sum(
        	Case 
                	when year(O.order_date) = '2019' then 1
                	else 0
        	end
    	    ) as orders_in_2019 
	    
from 
	Users U left join Orders O 
	on U.user_id = O.buyer_id
	group by U.user_id , U.join_date
