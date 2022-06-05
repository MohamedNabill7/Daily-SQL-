select name as Customers
from Customers C full outer join Orders O
on C.id = O.customerId  
where O.customerId is null
