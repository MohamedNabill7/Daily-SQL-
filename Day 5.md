1.	Retrieve number of students who have a value in their age. 

        select
                count(St_Id) as NumberOfStd
        from
                Student
                where St_Age is not null


2.	Get all instructors Names without repetition

        select
                distinct(Ins_Name) 
        from 
                Instructor
                
                
3.	Display student with the following Format (use isNull function) Student ID || Student Full Name	|| Department name 

        select
                S.St_Id , Isnull(Concat(S.St_Fname,' ',S.St_Lname),'No Data') As FullName , D.Dept_Name 
        from
                Student S inner join Department D
                on D.Dept_Id = S.Dept_Id


4.	Display instructor Name and Department Name Note: display all the instructors if they are attached to a department or not

        select
                I.Ins_Name , D.Dept_Name 
        from
                Instructor I left outer join Department D
                on D.Dept_Id = I.Dept_Id


5.	Display student full name and the name of the course he is taking For only courses which have a grade  

        select
                concat(S.St_Fname,' ',S.St_Lname) as FullName , SC.Crs_Id , C.Crs_Name
        from
                Student S inner join Stud_Course SC
                on SC.St_Id = S.St_Id
                        inner join Course C
                        on C.Crs_Id = SC.Crs_Id
                where SC.Grade is not null


6.	Display number of courses for each topic name

        select 
                Crs_Name , count(Crs_Id) as NumOfTopic 
        from
                Course
                group by Crs_Name


7.	Display max and min salary for instructors

        select
                max(Salary) as MaximumSalary , min(Salary) as MinimumSalary 
        from
                Instructor


8.	Display instructors who have salaries less than the average salary of all instructors.

        select * 
        from
                Instructor 
                where Salary < (select avg(salary) from Instructor)


9.	Display the Department name that contains the instructor who receives the minimum salary.

        select 
                I.Ins_Name , D.Dept_Name 
        from
                Department D inner join Instructor I
                on D.Dept_Id = I.Dept_Id
                where I.Salary = (select min(salary) from Instructor)


10.	Select max two salaries in instructor table. 
        
        select
                top(2)*
        from
                Instructor
                order by Salary desc


11.	Select instructor name and his salary but if there is no salary display instructor bonus. “use one of coalesce Function”

        select
                Ins_Name , coalesce(Salary,1500)
        from
                Instructor


12.	Select Student first name and the data of his supervisor

        select 
                X.St_Fname ,S.* 
        from
                Student S , Student X
                where X.st_super = S.St_Id


13.	Write a query to select the highest two salaries in Each Department for instructors who have salaries. “using one of Ranking Functions”

        select
                top(2)*
        from 
                ( select *,ROW_NUMBER() over(order by Salary DESC) as RN
		        from Instructor) as NewTable 


14.	Write a query to select a random  student from each department.  “using one of Ranking Functions”

        select *
        from (select *,DENSE_RANK() over (partition by dept_id order by Dept_Id) as DR  from Student) as NewTable
        order by newId()

        
        
