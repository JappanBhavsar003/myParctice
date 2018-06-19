WITH T AS(
	SELECT CP.CustomerProductID, CP.SerialNum, CP.MainParentCustProdID FROM CustomerProducts CP WHERE CP.AgencyID = 51 AND CP.CustomerProductID = 181
	UNION ALL 
	SELECT CP1.CustomerProductID, CP1.SerialNum, CP1.MainParentCustProdID FROM CustomerProducts CP1
	INNER JOIN T t1 ON t1.MainParentCustProdID = CP1.CustomerProductID
	WHERE CP1.AgencyID = 51
)
SELECT * FROM T

--select * from customerproducts
SELECT CP.CustomerProductID, CP.SerialNum, CP.MainParentCustProdID FROM CustomerProducts CP WHERE CP.AgencyID = 51
