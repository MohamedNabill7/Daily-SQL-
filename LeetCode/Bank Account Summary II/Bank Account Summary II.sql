select 
        S.name ,
        sum(T.amount) as balance   
from 
        Users S join Transactions T
        on S.account = T.account
        group by S.name
        having sum(amount) > 10000
