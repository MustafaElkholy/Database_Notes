
select [PRJNO], [Title], [ManagerId], [StartDate], [InitialCost], [Parked], [CRNNO]
from pm.Projects

select * from pm.Projects

select [PRJNO] as 'Project Number', [Title] as 'Project Title', [ManagerId]
from pm.Projects

-- Where Clause
select * from pm.Projects where InitialCost < 1000000

select * from pm.Projects where InitialCost > 1000000 and StartDate <= '2022-03-01'
select * from pm.Projects where InitialCost > 1000000 and StartDate >= '2022-03-01'

-- Like =>  compare by a certain pattern using (percent % and underscore _)

--%P any value end with P
select * from pm.Projects where Title like '%P'

--C% any value starts with P
select * from pm.Projects where Title like 'c%'
----------------------------------------------------------

-- like %C% any value contatins P اي فاليو فيها حرف ال سي
select * from pm.Projects where Title like '%c%'

select * from pm.Projects where Title like '%ca%'

select * from pm.Projects where Title like '%des%'
----------------------------------------------------------

--like _R% means that second letter of the value must be R

select * from pm.Projects where Title like '_r%'
----------------------------------------------------------

-- the last two values are UB
select * from pm.Projects where Title like '_uB'

-- the last two values are RP
select * from pm.Projects where Title like '_RP'
----------------------------------------------------------
-- like '_R_' value of 3 letters and the R letter in the middle
select * from pm.Projects where Title like '_R_'

-- like '_u_' value of 3 letters and the u letter in the middle
select * from pm.Projects where Title like '_u_'

-- we can use like in dealing with numbers also
select * from pm.Projects where InitialCost  like '_5%'


------------------------------------------------------------------------------------------

-- Top
-- select the top 3 records of project table 
select Top  3 * from pm.Projects

-- select the 2% of the rows in the project table	
select top 2 percent * from PM.Projects

------------------------------------------------------------------------------------------

-- order by
-- default ins ASC
select * from pm.Projects order by StartDate

select * from pm.Projects order by StartDate desc

-- order by two columns 
select * from pm.Projects order by InitialCost , StartDate desc

------------------------------------------------------------------------------------------
-- Group by
-- groub data based on a column

-- dublicate vlues will be shown
select p.Title 
from pm.Projects P

-- no dublicated values 
select p.Title 
from pm.Projects P
group by Title

-----------------
-- here will show the titles in projects and اتكررت كام مرة
-- select how many projects i have and its title

select p.Title , COUNT(p.PRJNO)
from pm.Projects P
group by Title

select ManagerId , COUNT(*) 
from pm.Projects 
group by ManagerId

select ManagerId , COUNT(*) 
from pm.Projects 
where Parked = 0
group by ManagerId

select ManagerId , COUNT(*) 
from pm.Projects 
where Parked = 0
group by ManagerId
having COUNT(*) >= 2 

------------------------------------------------------------------------------------------
-- distinct
select distinct Title from pm.Projects

------------------------------------------------------------------------------------------
-- Table Joins
-- cartisian join or cross join
select p.[PRJNO], p.Title , M.Id , m.Email
from pm.Managers M , pm.Projects P

-- inner join match two tables 
-- select matcing tables with where
select p.[PRJNO], p.Title , M.Id , m.Email
from pm.Managers M , pm.Projects P
where m.Id = p.ManagerId

select p.[PRJNO], p.Title ,p.ManagerId, M.Id , m.Email
from pm.Managers M , pm.Projects P
where m.Id = p.ManagerId

-- select matcing tables with inner join clause
select p.[PRJNO], p.Title , M.Id , m.Email
from pm.Managers M inner join pm.Projects P
on m.Id = p.ManagerId

select p.[PRJNO] as N'رقم المشروع', p.Title as N'إسم المشروع' , m.Email as N'عنوان البريد الإلكترونى لمدير المشروع'
from pm.Managers M inner join pm.Projects P
on m.Id = p.ManagerId

-- left outer join  (select all rows from left table even if there is no match)

-- all the project names and any project that has no company
select p.[PRJNO] as N'رقم المشروع',
	   p.Title as N'إسم المشروع' ,
       C.CompanyName as N'الشركة المنفذة للمشروع'
from  pm.Projects P left join pm.Companies C
on c.CRNNO = p.CRNNO

-- all the companies names and any any company that manage no projects
select p.[PRJNO] as N'رقم المشروع',
	   p.Title as N'إسم المشروع' ,
       C.CompanyName as N'الشركة المنفذة للمشروع'
from  pm.Companies C left join pm.Projects P
on c.CRNNO = p.CRNNO

select * from PM.Companies
select * from pm.Projects

-----------------------------------------------------------------------------------------------------

-- update

update p 
set p.StartDate = '2022-01-11'
from PM.Projects P
where p.PRJNO = 406

-- delete (delete record from a column)

delete from pm.Projects
where PRJNO = 406

-----------------------------------
-- sub query

update pm.Projects set InitialCost = InitialCost * 1.1
where
PRJNO in 
(select PRJNO from pm.ProjectTechnologies PT where
pt.TechnologyId = (select t.Id from pm.Technologies T  where t.Name = 'Oracle') )

select * from pm.Projects