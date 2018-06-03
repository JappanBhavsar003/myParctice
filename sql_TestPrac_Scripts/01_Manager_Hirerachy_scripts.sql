Declare @id int = 5;


with EmployeeCTE AS 
(
	select employeeID, employeeName, MAnagerID
	from employees
	where employeeID = @id

	union all 

	select e1.employeeID, e1.employeeName, e1.MAnagerID
	from employees e1
	join EmployeeCTE e2 on e1.employeeID = e2.managerID
)

--select * from EmployeeCTE


select e1.employeeName, ISNULL(e2.employeeName, 'No Boss') AS ManagerName from EmployeeCTE e1
left outer join EmployeeCTE e2 on e1.managerID = e2.employeeID