select * from Tasks where GrievanceID = 315

select * from CustomerProducts

UPDATE Tasks set ExpCompletionDT = '2018-06-15 12:40:00' where GrievanceID = 318


select * from (SeLECT CustomerProducts.SerialNum, CustomerProducts.HM_StatusID, Agencies.AgencyName from CustomerProducts join Agencies on CustomerProducts.CustomerID = Agencies.AgencyID) T
where T.SerialNum <> ''


-- USING CTE
WITH T(SerialNumber, HMStts, AgnName)
AS
( SELECT CustomerProducts.SerialNum, CustomerProducts.HM_StatusID, Agencies.AgencyName 
	from CustomerProducts join Agencies on CustomerProducts.CustomerID = Agencies.AgencyID )
SELECT * FROM T WHERE T.SerialNumber <> ''

-- USING CTE 2
WITH T(SerialNumber, HMStts, AgnName, AgnID)
AS
( SELECT CustomerProducts.SerialNum, CustomerProducts.HM_StatusID, Agencies.AgencyName , Agencies.AgencyID
	from CustomerProducts join Agencies on CustomerProducts.CustomerID = Agencies.AgencyID ),
T1(UserName, AgnID)
AS
( SELECT Users.UserName, Agencies.AgencyID FROM Users JOIN Agencies ON Agencies.AgencyID = Users.AgencyID)
SELECT T.* , T1.UserName FROM T JOIN T1 ON T.AgnID = T1.AgnID

-- Recursive CTE
WITH ShowRecursiveMessage(STATEMENT, LENGTH)
AS
(
SELECT STATEMENT = CAST('I Like' AS VARCHAR(500)),
		LEN('I Like')
		
UNION ALL

SELECT 
	CAST(STATEMENT + ' CTE' AS VARCHAR(500)),
	LEN(STATEMENT) FROM ShowRecursiveMessage
	WHERE LENGTH < 500		
)

SELECT * FROM ShowRecursiveMessage
OPTION (MAXRECURSION 1000)



