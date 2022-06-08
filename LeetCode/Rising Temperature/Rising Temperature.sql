select
        id
from (
        select 
                *, lag(temperature) over(order by recordDate) lag_pivot , lag(recordDate) over(order by recordDate) previousdate
        from 
                Weather 
      ) w       
where temperature > lag_pivot and recordDate = DATEADD(day, 1,previousdate)
