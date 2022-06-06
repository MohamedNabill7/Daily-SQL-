select 
        iif(E.employee_id is null,S.employee_id,E.employee_id) as employee_id
from 
        Employees E full outer join Salaries S
        on E.employee_id = S.employee_id
        where E.employee_id is null or S.employee_id is null
        order by employee_id
