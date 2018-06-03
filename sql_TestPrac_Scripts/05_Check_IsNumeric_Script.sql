-- Check for ISNUMERIC use

-- select * from testTable

-- Get Only numeric data

select * from testTable where ISNUMERIC(Value)  = 1