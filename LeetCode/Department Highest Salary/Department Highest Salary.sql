select  Department , 
        Employee ,
        Salary
        
from (select D.name as Department , 
             E.name as Employee ,
             E.salary as Salary,
             Dense_Rank() over(partition by D.id order by E.salary desc) as DR from Employee E join Department D on D.id=E.departmentId) newTable
where DR=1
