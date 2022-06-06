select 
        case
                when count(id) = 1  then null 
                else (select max(salary) from Employee where salary < (select max(salary) from Employee))
        end as SecondHighestSalary
from
        Employee
