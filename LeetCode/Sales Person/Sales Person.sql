select 
        name
from 
        SalesPerson
        where sales_id not in (
                                select
                                        O.sales_id 
                                from
                                        Orders O inner join Company C
                                        on C.com_id = O.com_id
                                        where C.name = 'RED' 
                               )
