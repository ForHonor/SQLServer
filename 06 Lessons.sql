-- Step #1 - read the schema so SQL makes SQL
Select 'select * from [' + table_Name + ']' from information_schema.tables


-- Step #2 - Copy from the results window into SQL window
select * from [Address]
select * from [Person]
select * from [PersonAddress]
select * from [State]

-- Step #3A - order by clause
select * from [Person]
order by Firstname
-- Step #3B - order by clause
select * from [Person]
order by LastName

 --Step #4 Where clause - old people
select 'Where Clause Old People' as QueryType,* 
from [Person]
where Birthdate < '1/1/1985'

-- Step #5 - put it all together
SELECT [PersonID]
      ,[FirstName]
      ,[LastName]
      ,[Prefix]
      ,[Suffix]
      ,[Birthdate]
FROM [dbo].[Person]
where Birthdate < '1/1/1985'
order by LastName

-- Step #6 - alias - handy when multiple tables come together - same exact results as 5
SELECT P.[PersonID]
      ,P.[FirstName]
      ,P.[LastName]
      ,P.[Prefix]
      ,P.[Suffix]
      ,P.[Birthdate]
FROM [dbo].[Person] P
where P.Birthdate < '1/1/1985'
order by P.LastName

-- Step #7 - look for differences
SELECT [PersonID]
      ,[FirstName]
      ,[LastName]
      ,[Prefix]
      ,[Suffix]
      ,[Birthdate]
FROM [dbo].[Person]
where Birthdate < '1/1/1985'

 except 

SELECT P.[PersonID]
      ,P.[FirstName]
      ,P.[LastName]
      ,P.[Prefix]
      ,P.[Suffix]
      ,P.[Birthdate]
FROM [dbo].[Person] P
where P.Birthdate < '1/1/1985'


-- Step #8 - alias - handy when multiple tables come together - same exact results as 5
SELECT [PersonID]
      ,[FirstName]
      ,[LastName]
      ,[Prefix]
      ,[Suffix]
      ,[Birthdate]
FROM [dbo].[Person]
where Birthdate < '1/1/1985'

 intersect

SELECT P.[PersonID]
      ,P.[FirstName]
      ,P.[LastName]
      ,P.[Prefix]
      ,P.[Suffix]
      ,P.[Birthdate]
FROM [dbo].[Person] P
where P.Birthdate < '1/1/1985'


-- Step #9 - union - dedupe merge
SELECT [PersonID]
      ,[FirstName]
      ,[LastName]
      ,[Prefix]
      ,[Suffix]
      ,[Birthdate]
FROM [dbo].[Person]
where Birthdate < '1/1/1985'

 union

SELECT P.[PersonID]
      ,P.[FirstName]
      ,P.[LastName]
      ,P.[Prefix]
      ,P.[Suffix]
      ,P.[Birthdate]
FROM [dbo].[Person] P
where P.Birthdate < '1/1/1985'

-- Step #10 - union all - join the two sets together without de duping
SELECT [PersonID]
      ,[FirstName]
      ,[LastName]
      ,[Prefix]
      ,[Suffix]
      ,[Birthdate]
FROM [dbo].[Person]
where Birthdate < '1/1/1985'

 union all 

SELECT P.[PersonID]
      ,P.[FirstName]
      ,P.[LastName]
      ,P.[Prefix]
      ,P.[Suffix]
      ,P.[Birthdate]
FROM [dbo].[Person] P
where P.Birthdate < '1/1/1985'

