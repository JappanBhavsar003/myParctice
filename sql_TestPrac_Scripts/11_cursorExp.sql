--select * from products

SET NOCOUNT ON
DECLARE @ID INT 
DECLARE @Product VARCHAR(50)
DECLARE @Salary INT
DECLARE Cur_prod CURSOR 
STATIC FOR 
SELECT Products.ProductID,	Products.ProdName FROM Products

-- OPEN Cursor
OPEN Cur_prod
IF @@CURSOR_ROWS > 0
	BEGIN 
	FETCH NEXT FROM Cur_prod INTO @ID, @Product
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT 'Product ID: ' + CONVERT(VARCHAR(20), @ID) + ', Product Name: ' + CAST(@Product AS VARCHAR(100))
		FETCH NEXT FROM Cur_prod INTO @ID, @Product
	END
	END
CLOSE Cur_prod
DEALLOCATE Cur_prod
SET NOCOUNT OFF

