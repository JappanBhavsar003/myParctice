IF OBJECT_ID(N'dbo.recursiveCall', N'FN') IS NOT NULL
	DROP FUNCTION recursiveCall;

ALTER FUNCTION recursiveCall(@ProdID int)
RETURNS int
AS 
BEGIN
	IF @ProdID = 1
	BEGIN 
		RETURN 1;
	END
	--ELSE
	--BEGIN
		RETURN @ProdID * dbo.recursiveCall(@ProdID -1); 		
	--END
END;


select dbo.recursiveCall(3)

-- Temp  Table
ALTER FUNCTION getRecurisveProducts(@productID BIGINT, @level INT)
RETURNS @rtnTbl TABLE 
(
	ProdID BIGINT NOT NULL,
	ProductName VARCHAR(200) NOT NULL,
	MainProdID BIGINT NOT NULL,
	Level INT NOT NULL

)
AS
BEGIN
	DECLARE @myTmpTbl TABLE(
		ProdID BIGINT NOT NULL,
		ProductName VARCHAR(200) NOT NULL,
		MainProdID BIGINT NOT NULL,
		Level INT NOT NULL
	)
	-- Insert into temp table 
	INSERT INTO @myTmpTbl SELECT P.ProductID AS ProdID, P.ProdName AS ProductName, P.MainProdID AS MainProdID, @level AS Level
		FROM Products P WHERE ProductID = @productID

	IF ((SELECT M.MainProdID FROM @myTmpTbl AS M) <> 0)
	BEGIN
		INSERT INTO @myTmpTbl
			SELECT * FROM getRecurisveProducts((SELECT M.MainProdID FROM @myTmpTbl AS M), @level + 1)
		INSERT INTO @rtnTbl
		SELECT * FROM @myTmpTbl
		RETURN
	END
	--ELSE 
	--BEGIN 
		INSERT INTO @rtnTbl
		SELECT * FROM @myTmpTbl
		RETURN
	--END	
END

SELECT * FROM getRecurisveProducts(6,0)