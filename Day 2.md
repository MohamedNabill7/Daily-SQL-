### Display the Department id, name and id and the name of its manager

	SELECT

		Departments.Dnum,
		Departments.Dname,
		Dependent.Dependent_name,
		Dependent.ESSN
	FROM 
		Departments INNER JOIN Dependent
		ON Departments.MGRSSN = Dependent.ESSN

----------------------------------------------------------------------------------------------

-- Display the name of the departments and the name of the projects under its control

SELECT 
	D.Dname ,
	P.Pname
FROM 
	Departments D INNER JOIN Project P
ON D.Dnum = P.Dnum 
----------------------------------------------------------------------------------------------

-- Display the full data about all the dependence associated with the name of the employee they depend on him/her
SELECT 
	*
FROM 
	Dependent 

-- Display the Id, name and location of the projects in Cairo or Alex city

SELECT 
	Pnumber,
	Pname,
	Plocation 
FROM 
	Project
WHERE CITY IN ('CAIRO','ALEX')
----------------------------------------------------------------------------------------------

-- Display the Projects full data of the projects with a name starts with "a" letter
SELECT * 
FROM Project
WHERE Pname LIKE 'a%'
----------------------------------------------------------------------------------------------

-- Display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
SELECT E.* 
FROM Employee E, Departments D
WHERE E.Dno = D.Dnum 
	  AND D.Dnum = 30
	  AND E.Salary BETWEEN 1000 AND 2000
----------------------------------------------------------------------------------------------

-- Retrieve the names of all employees in department 10 who works more than or equal 10 hours per week on "AL Rabwah" project
SELECT DISTINCT(CONCAT(E.Fname,' ',E.Lname)) AS Name 
FROM Employee E INNER JOIN Departments D
ON E.Dno = D.Dnum AND D.Dnum = 10
INNER JOIN Works_for W 
ON E.SSN = W.ESSn AND W.Hours * 7  >= 10
INNER JOIN Project P 
ON E.Dno = P.Dnum
----------------------------------------------------------------------------------------------

-- Find the names of the employees who directly supervised with Kamel Mohamed
SELECT Dependent_name AS Names
FROM Dependent D , Employee E
WHERE D.ESSN = E.Superssn
	  AND E.Fname = 'KAMEL' AND E.Lname = 'MOHAMED'
----------------------------------------------------------------------------------------------

-- Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name
SELECT CONCAT(E.Fname,' ',E.Lname) AS Name , P.Pname  
FROM Employee E INNER JOIN Project P
ON E.Dno = P.Dnum
ORDER BY P.Pname
----------------------------------------------------------------------------------------------

-- For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate
SELECT P.Pnumber,D.Dname,E.Lname,E.Address,E.Bdate 
FROM Project P INNER JOIN Departments D
ON P.Dnum = D.Dnum AND  P.CITY = 'CAIRO'
INNER JOIN Employee E 
ON D.MGRSSN = E.Superssn
----------------------------------------------------------------------------------------------

-- 	Display All Data of the mangers
SELECT *
FROM Employee E INNER JOIN Departments D
ON E.Superssn = D.MGRSSN
----------------------------------------------------------------------------------------------

-- Display All Employees data and the data of their dependents even if they have no dependents
SELECT * 
FROM Employee E FULL OUTER JOIN Dependent D
ON E.SSN = D.ESSN
----------------------------------------------------------------------------------------------

-- Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233
INSERT INTO Employee(Dno,SSN,Superssn)
VALUES(30,102672,112233)
----------------------------------------------------------------------------------------------

-- Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or manager number to him
INSERT INTO Employee(Dno,SSN)
VALUES(30,102660)
----------------------------------------------------------------------------------------------

-- In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
INSERT INTO Departments(Dname,Dnum,MGRSSN,[MGRStart Date])
Values('DEPT IT',100,112233,'1-11-2006')

