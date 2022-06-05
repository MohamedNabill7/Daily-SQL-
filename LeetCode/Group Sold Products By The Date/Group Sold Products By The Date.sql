with no_duplicate_activities
as
(
    select
        sell_date  , product
    from
        Activities
        group by sell_date, product
)

select  
        sell_date ,
        count(distinct(product)) as num_sold , 
        string_agg(product,',') within group (order by product asc) as products
from 
        no_duplicate_activities
        group by sell_date
