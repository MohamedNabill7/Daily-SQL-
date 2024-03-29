### Display (Using Union Function)
### a.The name and the gender of the dependence that's gender is Female and depending on Female Employee.
### b.And the male dependence that depends on Male Employee.

        SELECT 
                D.Dependent_name,D.Sex
        FROM
                Dependent D , Employee E
                WHERE D.ESSN = E.Superssn AND E.SEX = 'F'AND D.Sex = 'F'
                UNION ALL
                        SELECT 
                                D.Dependent_name,D.Sex
                        FROM
                                Dependent D , Employee E
                                WHERE D.ESSN = E.Superssn AND E.SEX = 'M'AND D.Sex = 'M'


### For each project,list the project name and the total hours per week (for all employees) spent on that project.

        SELECT
                P.Pname , SUM(W.Hours) AS TOTAL_HOURS 
        FROM
                Project P , Works_for W
                WHERE P.Pnumber = W.Pno
                GROUP BY P.Pname
                ORDER BY TOTAL_HOURS ASC


### Display the data of the department which has the smallest employee ID over all employees' ID.
        
        SELECT
                D.* 
        FROM
                Departments D , Employee E
                WHERE D.Dnum = E.Dno AND E.SSN = (SELECT MIN(SSN) FROM Employee)


### For each department, retrieve the department name and the maximum, minimum and average salary of its employees.

        SELECT
                D.Dname , MAX(E.Salary) AS MAX_SALARY ,MIN(E.Salary) AS MIN_SALARY , AVG(ISNULL(E.Salary,0)) AS AVG_SALARY 
        FROM 
                Departments D , Employee E
                WHERE D.Dnum = E.Dno
                GROUP BY D.Dname


### List the last name of all managers who have no dependents

        SELECT
                E.Lname 
        FROM 
                Employee E 
                EXCEPT
                        SELECT E.Lname 
                        FROM Employee E , Dependent D
                        WHERE E.SSN = D.ESSN


### For each department
### a. if its average salary is less than the average salary of all employees
### b. display its number, name and number of its employees.

        SELECT
                D.Dnum ,D.Dname , COUNT(E.SSN)
        FROM 
                Departments D , Employee E
                WHERE D.Dnum = E.Dno
                GROUP BY D.Dnum ,D.Dname
                HAVING AVG(E.Salary) < (SELECT AVG(Salary) FROM Employee)


### Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.

        SELECT 
                CONCAT(E.Fname,' ',E.Lname) AS FULL_NAME , P.Pname   
        FROM 
                Employee E INNER JOIN Project P
                ON E.Dno = P.Dnum
                        INNER JOIN Departments D 
                        ON E.Dno = D.Dnum
                        ORDER BY D.Dname , E.Lname ASC , E.Fname ASC


### Try to get the max 2 salaries using subquery

        SELECT 
                MAX(Salary)  AS '1ST_MAX_SALARY',
        (SELECT MAX(SALARY) FROM 
                                Employee 
                                WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee)) AS '2ND_MAX_SALARY' FROM EMPLOYEE


### Get the names of employees that is similar to any dependent name

        SELECT
                CONCAT(E.Fname,' ',E.Lname) AS FULL_NAME 
        FROM 
                Employee E , Dependent D
                WHERE E.SSN = D.ESSN AND SUBSTRING(D.Dependent_name,1,LEN(E.Fname)) IN (SELECT Fname FROM Employee)


### Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), and they give you(your SSN =102672) her position (Dept. 20 manager) 
### a.First try to update her record in the department table

        UPDATE
                Departments
        SET
                MGRSSN = 968574
                WHERE Dnum = 100

### b.Update your record to be department 20 manager.
        UPDATE
                Departments
        SET
                MGRSSN = 102672
                WHERE  Dnum = 20

### c.Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
        UPDATE
                Employee
        SET 
                Superssn =  102672
                WHERE SSN = 102660


### Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344)so try to delete his data from your database in case you know that you will be temporarily in his position.Hint: (Check if Mr. Kamel has dependents, works as a department manager,supervises any employees or works in any projects and handle these cases).

        DELETE 
        FROM 
                Employee 
                WHERE SSN = 223344


### Try to update all salaries of employees who work in Project ‘AlRabwah’ by 30% 

        UPDATE
                Employee
        SET 
                Salary = Salary + Salary*.3 
        WHERE SSN IN 
                (SELECT 
                        E.SSN 
                 FROM 
                        Employee E , Works_for W , Project P 
                        WHERE E.SSN = W.ESSn AND W.Pno = P.Pnumber AND P.Pname ='AlRabwah' )

