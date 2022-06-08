select 
        customer_id , count(visit_id) as count_no_trans
from
        Visits 
        where visit_id not in (select distinct(visit_id) from Transactions) 
        group by customer_id
        order by count_no_trans desc
