-- Find Highest department which is contaning higest number of employees

--select d.departmentID ,d.departmentName, COUNT(*) as highest_Emp from Departments d
--join Employees3 e on d.departmentID = e.departmentID
--group by d.departmentID, d.departmentNAme order by COUNT(*) DESC

-- you can use top 1 for only get highest 
-- Kudventa vada ne only department name joie chie so count ne order by ma muki didhu


select TOP 1 d.departmentName from Departments d
join Employees3 e on d.departmentID = e.departmentID
group by d.departmentNAme order by COUNT(*) DESC

 