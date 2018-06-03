--select * from employees

-- get employees which name are starting from 's'

-- 1. using like

select * from Employees where EmployeeName like 's%'

-- 2. CharIndex 

select * from Employees where CHARINDEX('S', EmployeeName) = 1

-- 3. Left

select * from Employees where LEFT(EmployeENAme, 1) = 's'

-- SUBSTRING 

select * from Employees where SUBSTRING(EmployeeName, 1,1) = 's'


 