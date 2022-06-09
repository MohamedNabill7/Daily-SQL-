select Y.name as Employee
from Employee X , Employee Y
where X.id = Y.managerId and X.salary < Y.salary
