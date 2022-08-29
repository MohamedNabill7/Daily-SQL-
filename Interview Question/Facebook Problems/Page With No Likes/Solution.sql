select 
	distinct(page_id) 
from 
	pages 
where 
	page_id not in (select distinct(P.page_id) 
                        from Pages P right join page_likes PL
                        on P.page_id = PL.page_id)
order by page_id 
