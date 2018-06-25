-- Connect database
USE TestPrac
GO

-- Example of Dynamic String Concatnation
DECLARE @SQL NVARCHAR(MAX)
SET @SQL = 'SELECT ProdName,' + 'ProductID ' + 'FROM Products'

EXEC(@SQL)


-- static string attached
SELECT '[{productID:'+ cast(P.ProductID as varchar(20)) +'}]' FROM Products P



-- COALESCE
DECLARE @Name varchar(2000)
SELECT @Name = COALESCE(@Name + ',','') + ProdName
FROM Products

SELECT @Name


-- XML USE
SELECT ',' + Name FROM Customer FOR XML PATH ('')

-- STUFF (JSON string working )
SELECT '[' + CAST(stuff((SELECT ',{ProductName: ' + CAST(ProdName AS VARCHAR(50)) 
		+ ',ProductID:' + CAST(ProductID AS VARCHAR(50)) + '}' FROM Products FOR XML PATH ('')),1,1,'') AS VARCHAR(MAX)) + ']'

-- from SELECT abc = stuff((SELECT ',' + Name FROM Products FOR XML PATH ('')),1,1,'')-- from customer



