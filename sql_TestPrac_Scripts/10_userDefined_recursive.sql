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


ALTER FUNCTION getRecurisveProducts(@productID INT)
RETURNS 
AS
BEGIN
	
END