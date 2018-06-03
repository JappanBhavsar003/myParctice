-- select * from Employees1

with empCTE as(
	select * , ROW_NUMBER() OVER (PARTITION BY ID ORDER BY ID) AS RowNumber 
	from Employees1 
)

-- select * from empCTE

DELETE FROM empCTE WHERE RowNumber > 1