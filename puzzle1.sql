CREATE TABLE lag
(
BusinessEntityID INT
,SalesYear   INT
,CurrentQuota  DECIMAL(20,4)
)
GO
 
INSERT INTO lag
SELECT 275 , 2005 , '367000.00'
UNION ALL
SELECT 275 , 2005 , '556000.00'
UNION ALL
SELECT 275 , 2006 , '502000.00'
UNION ALL
SELECT 275 , 2006 , '550000.00'
UNION ALL
SELECT 275 , 2006 , '1429000.00'
UNION ALL
SELECT 275 , 2006 ,  '1324000.00'

--Solution 1
select *, lag(CurrentQuota,1,0) over(order by (select null)) as lagCurrentData from lag

--Solution 2
;WITH CTE AS
(
	select BusinessEntityId, Salesyear, CurrentQuota, ROW_NUMBER() over(order by (select null)) as MyId
	from lag
)

SELECT c.BusinessEntityID, c.SalesYear, c.CurrentQuota, ISNULL(d.CurrentQuota, 0) NextCurrentData
FROM CTE c LEFT JOIN CTE d ON C.MyId - 1 = (D.MyID);
