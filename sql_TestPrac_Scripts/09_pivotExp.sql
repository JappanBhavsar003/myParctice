--SELECT * from Customer c
--join custprod cp on cp.CustID = c.CustID
--join Products p on cp.ProdID = p.ProductID

-- This is for total product sells to customer count
WITH T AS (select c.Name, p.ProdName, COUNT(p.ProdName) AS ProdCount from Customer c 
join CustProd cp on c.CustID = cp.CustID
join Products p on cp.ProdID = p.ProductID
--where c.CustID =  1
group by p.ProdName, C.Name)
SELECT * FROM T WHERE T.Name <> ''


-- PIVOT 
DECLARE @pivot_Coloumn nvarchar(max);
DECLARE @query nvarchar(max);
SELECT @pivot_Coloumn = COALESCE(@pivot_Coloumn+',','')+QUOTENAME(prodName) FROM (SELECT * FROM Products)TAB

SELECT @query = 'SELECT Name, ' + @pivot_Coloumn + 'From 
(SELECT c.Name, p.ProdName FROM Customer C join custprod cp on c.custID = cp.custID join products p on cp.prodID = p.productID )TAB1
pivot 
(
COUNT(prodName) FOR prodName IN ('+ @pivot_Coloumn +')) AS TAB2'

EXEC sp_executesql @query









