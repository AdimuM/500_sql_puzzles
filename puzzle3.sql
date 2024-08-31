CREATE TABLE EmpBirth
(
 EmpId INT  IDENTITY(1,1) 
,EmpName VARCHAR(50) 
,BirthDate DATETIME 
)
 
--Insert Data
INSERT INTO EmpBirth(EmpName,BirthDate)
SELECT 'Pawan' , '12/04/1983'
UNION ALL
SELECT 'Zuzu' , '11/28/1986'
UNION ALL
SELECT 'Parveen', '05/07/1977'
UNION ALL
SELECT 'Mahesh', '01/13/1983'
UNION ALL
SELECT'Ramesh', '05/09/1983'
 
--Verify data
SELECT EmpId,EmpName,BirthDate FROM EmpBirth

--Solution 1
select EmpName,FORMAT(BirthDate, 'yyyy-MM-dd') as BirthDate from EmpBirth
where (datepart(month, BirthDate) = 5 and datepart(day, BirthDate) between 7 and 15);

--Solution 2
select EmpName,FORMAT(BirthDate, 'yyyy-MM-dd') as BirthDate from EmpBirth
where format(BirthDate, 'MM-dd') between '05-07' and '05-15';

--Solution 3
select EmpName,FORMAT(BirthDate, 'yyyy-MM-dd') as BirthDate from EmpBirth
where month(BirthDate)=5 and day(BirthDate) between 7 and 15;