select 
        Department ,
        Employee ,
        Salary
from (select 
             D.name as Department , E.name as Employee , E.salary as Salary,
             Dense_Rank() over(partition by D.id order by E.salary desc) DR
      from Department D join Employee E on D.id = E.departmentId) NewTable
where DR in (1,2,3)
