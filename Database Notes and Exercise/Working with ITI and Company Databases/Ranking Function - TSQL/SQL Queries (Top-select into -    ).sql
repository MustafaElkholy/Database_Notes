use ITI

select top(4) (salary) from Instructor

select top(2) salary from Instructor
order by Salary desc

select  top(8) salary from Instructor
order by Salary desc

select distinct top(8)  salary from Instructor
order by Salary desc

-- with tie
select top (5) with ties * 
from Student
order by St_Age

select top (5) with ties * 
from Student
order by St_Age desc

select NEWID()

select *,newid()
from Student

select *
from Student
order by newid()

select s.St_Fname + ' ' +s.St_Lname as FullName
from student s
order by FullName

-- because of where is executed before select 
select * 
from 
(select St_Fname + ' ' +St_Lname as FullName from Student as FullName) as NewTable
where FullName = 'Amr Magdy'

-- exexution order
-- from
-- join
-- on
-- where
-- group
-- having
-- group
-- select
-- order by
-- top

-----------------
--- connect to database that i don't use
select *
from [DESKTOP-UTH1O1Q].[iti].[dbo].[student]

select *
from Company_SD.dbo.Project

-- join tables from diffrent databases (union)

select Dept_Name 
from ITI.dbo.Department 
union all
select  Dname
from  Company_SD.dbo.Departments

--------------------------------------------------------
-- join tables from diffrent Servers (union)

--select Dept_Name 
--from ServerName.ITI.dbo.Department 
--union all
--select  Dname
--from  ServerName.Company_SD.dbo.Departments

--------------------------------------------------------

-- make new table with select 
-- It's a DDL statement
select * into NewStudents
from Student 

-- create new table with the same student table structure but withoud data
select * into newStud
from Student where St_Age < -1000

-- insert based on select

insert into newStud
select * from Student where St_Age > 24

 
-- aggregate without group by
select sum(salary)
from Instructor
having sum (Salary) > 1000

--select sum(salary)
--from Instructor
--having sum (select top(3) Salary from Instructor order by Salary desc) > 1000

select sum(salary)
from Instructor
having count (Ins_Id) < 20

