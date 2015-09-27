use ContactDB
go

-- Example 1 - inner join 
Select * from Address
Select * from state where StateID in (21,33)

Select A.Address1, A.Address2, A.City, S.StateCode, A.ZipCode 
from Address a
inner join State s on s.StateID = a.StateID


-- Example 2 - group by with join
Select s.StateCode, count(*) as AddressCount
from Address a
inner join State s on s.StateID = a.StateID
group by s.StateCode

-- Example 3 - inner join - find the people with any addresses
select * from person where LastName = 'Waid'
Select A.AddressID, A.Address1, A.Address2, A.City, S.StateCode, A.ZipCode 
from dbo.Address a
inner join dbo.State s on s.StateID = a.StateID
where s.StateCode = 'MD'

-- the oldest gets to retire by the see, the other 2 are brothers
INSERT INTO [dbo].[PersonAddress]
           ([PersonAddressID]
           ,[PersonID]
           ,[AddressID])
     VALUES
           (1
           ,2
           ,3)

INSERT INTO [dbo].[PersonAddress]([PersonAddressID],[PersonID],[AddressID])VALUES(2,11,2)
INSERT INTO [dbo].[PersonAddress]([PersonAddressID],[PersonID],[AddressID])VALUES(3,12,2)

-- first join a person and address together
Select P.Firstname, P.LastName, A.Address1, A.City,S.StateCode
from dbo.Person P
inner join dbo.PersonAddress PA on PA.PersonID = P.PersonID
inner join dbo.Address A on A.AddressID = PA.AddressID
inner join dbo.State S on S.StateID = A.StateID

-- Example 4 - Find the people without an address
Select P.FirstName, P.LastName
from dbo.Person P
left outer join dbo.PersonAddress PA on PA.PersonID = P.PersonID
where PA.PersonID is null


-- Example 5 - right outer join - give me a list of all states with address counts
Select S.StateName, count(A.StateID) as AddressCount
from dbo.Address A 
right outer join dbo.State S on S.StateID = A.StateID
group by S.StateName
order by count(A.StateID) desc, S.StateName


-- Example 6 - cross join - a report that lists all of the places people have addresses
Select P.FirstName, P.LastName, S.StateName
from dbo.Person P
cross join dbo.State S

-- Example 7 - Full outer join - find Orphans - people without addresses and addresses without people
-- Add an orphan address
Select * from State where StateCode = 'ID'

INSERT INTO [dbo].[Address]([Address1],[City],[StateID],[ZipCode]) VALUES('66 Fish Avenue','Boise',13,'83701')


Select P.PersonID, P.FirstName, PA.PersonAddressID, A.AddressID, A.Address1, A.City
from dbo.Person P
full outer join dbo.PersonAddress PA on PA.PersonID = P.PersonID
full outer join dbo.Address A on A.AddressID = PA.AddressID
where P.PersonID is null or A.AddressID is null
