select 
        U.name ,
        Isnull(sum(R.distance),0) as travelled_distance
from 
        Users U left outer join Rides R
        on U.id = R.user_id
        group by U.name , U.id
        order by travelled_distance desc , U.name asc
