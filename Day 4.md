1.	Display (Using Union Function)
	a.	 The name and the gender of the dependence that's gender is Female and depending on Female Employee.
	b.	 And the male dependence that depends on Male Employee.

a.

        select
                Dependent_name , Sex
        from 
                Dependent
                where Sex = 'F'
        union  
                select 
                        concat(Fname,' ',Lname) , Sex  
                from 
                        Employee
                        where Sex = 'F'

b.

        select
                Dependent_name , Sex 
        from 
                Dependent
                where Sex = 'M'
        union 
                select 
                        concat(fname,' ',lname) , Sex 
                from 
                        Employee
                        where Sex = 'M'



2.	For each project, list the project name and the total hours per week (for all employees) spent on that project

        select 
                p.Pname , sum(w.hours * 7) as TotalHours 
        from 
                Project p inner join Works_for w
                on p.Pnumber = w.Pno
                group by p.Pname


3.	Display the data of the department which has the smallest employee ID over all employees' ID.

        select
                * 
        from
                Departments
                where MGRSSN in (select min(MGRSSN) from Departments)


4.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees.

        select
                d.Dname , max(e.salary) as MaxSalary , min(e.Salary) as MinSalary , avg(e.Salary) as AvgSalary
        from 
                Departments d inner join Employee e
                on d.Dnum = e.Dno
                group by d.Dname

5.	List the last name of all managers who have no dependents.

        select
                distinct x.Lname 
        from
                Employee x inner join Employee y 
                on y.Superssn = x.SSN

6.	For each department if its average salary is less than the average salary of all employees display its number, name and number of its employees.

        select
                d.Dname , d.Dnum , count(e.SSN) as NumOfEmployees
        from 
                Departments d inner join Employee e
                on d.Dnum = e.Dno
                group by d.Dname , d.Dnum
                having avg(e.Salary) < (select avg(salary) from Employee)

7.	Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.

        select
                concat(e.fname,' ',e.lname) as FullName , p.Pname
        from 
                Employee e inner join Project p
                on p.Dnum = e.Dno
                where e.Fname is not null and e.Lname is not null
                order by p.Pname , e.Lname asc , e.Fname asc

