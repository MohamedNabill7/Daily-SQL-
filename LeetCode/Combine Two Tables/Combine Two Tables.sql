select P.firstName , P.lastName , A.city , A.state    
from Person P left outer join Address A
on P.personId = A.personId
