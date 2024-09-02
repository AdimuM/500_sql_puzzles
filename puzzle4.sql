CREATE TABLE #Movie
(
 
[MName] [varchar] (10) NULL,
[AName] [varchar] (10) NULL,
[Roles] [varchar] (10) NULL
)

GO
 
--Insert data in the table
 
INSERT INTO #Movie(MName,AName,Roles)
SELECT 'A','Amitabh','Actor'
UNION ALL
SELECT 'A','Vinod','Villan'
UNION ALL
SELECT 'B','Amitabh','Actor'
UNION ALL
SELECT 'B','Vinod','Actor'
UNION ALL
SELECT 'D','Amitabh','Actor'
UNION ALL
SELECT 'E','Vinod','Actor'
 
--Check your data
SELECT MName , AName , Roles FROM #Movie

--Solution1
select * from #Movie
where MName=(	
	select MName 
	from #Movie
	where Roles='Actor' and AName='Amitabh'
	intersect
	select MName 
	from #Movie
	where Roles='Actor' and AName='Vinod'
)

--Solution2
--it shows only the MName 
;with cte as
(
	select * 
	from #Movie 
	where Roles = 'Actor' and (AName = 'Amitabh' or AName = 'Vinod')
)
select MName
from cte
group by MName
having count(distinct AName)=2
