use iti

-- 1.	Retrieve number of students who have a value in their age. 
select St_Age
from Student

select count (st_age)  -- 14 of 14 student
from Student

select count (st_age)  -- 16 of 17 Student
from newStud

--2.	Get all instructors Names without repetition

select distinct I.Ins_Name
from Instructor I

-- 3.	Display student with the following Format (use isNull function)
-- Student ID	Student Full Name	Department name

select s.St_Id, ISNULL(s.St_Fname,'Stud') + ' '+ ISNULL(s.St_Lname,'Stud') as 'Full Name', D.Dept_Name
from Student S inner join Department D
on s.Dept_Id = d.Dept_Id

select s.St_Id, ISNULL(s.St_Fname + ' ' +s.St_Lname , 'NoData') as 'Full Name',d.Dept_Name
from Student S inner join Department D
on s.Dept_Id = d.Dept_Id

--4.	Display instructor Name and Department Name 
--		Note: display all the instructors if they are attached to a department or not

select ISNULL(s.St_Fname + ' ' +s.St_Lname , 'NoData') as 'Full Name' ,d.Dept_Name
from Student S left outer join Department D
on s.Dept_Id = d.Dept_Id

-- 5.	Display student full name and the name of the course he is taking
--		For only courses which have a grade  

select ISNULL(s.St_Fname + ' ' +s.St_Lname , 'NoData') as 'Full Name' ,c.Crs_Name
from Student S inner join Stud_Course SC
on s.St_Id = sc.St_Id
inner join Course C
on sc.Crs_Id = c.Crs_Id
where sc.Grade is not null


-- 6.	Display number of courses for each topic name

select t.Top_Name,COUNT(c.Crs_Id) as 'NO Course'
from Course C inner join Topic T
on t.Top_Id = c.Top_Id
group by t.Top_Name

-- 7.	Display max and min salary for instructors

select MAX(Salary) MaxSalary, MIN(Salary) MinSalar 
from Instructor

--------------------------------------------Ignore For now until Asking----------------------------
---- Select the max and min 2 salaries

--select *
--from (select * , DENSE_RANK() over(order by Salary desc) as D1 ,
--			     ROW_NUMBER() over(order by Salary asc) as D2
--				 from Instructor ) as NewTable
--where d1 = 12 or d2 = 1

-- 8.	Display instructors who have salaries less than the average salary of all instructors.

-- using subquery
select I.Ins_Name 
from Instructor I
where Salary < (select avg(Salary) from Instructor)

-- 9.	Display the Department name that contains the instructor who receives the minimum salary.
select d.Dept_Name
from Instructor I inner join Department D
on i.Dept_Id = d.Dept_Id
where i.Salary = (select min(Salary) from Instructor)

-- 10.	 Select max two salaries in instructor table. 
select top(2) salary
from Instructor 
order by Salary desc

-- 11.	 Select instructor name and his salary but if there is no salary display instructor bonus. “use one of coalesce Function”

select I.Ins_Name, coalesce (convert(varchar(10),i.Salary),'Instructor Bonus') as Salary
from Instructor I

-- 12.	Select Average Salary for instructors 

select avg(salary)
from Instructor

-- 13.	Select Student first name and the data of his supervisor 

select N.St_Fname + ' ' + N.St_Lname, s.* 
from Student N, Student S
where N.St_super = s.St_Id

-- 14.	Write a query to select the highest two salaries in Each Department for instructors who have salaries.
--		“using one of Ranking Functions”

select * 
from (select * , DENSE_RANK() over (partition by dept_id order by salary desc) as DN
				 from Instructor )as NewTable
where DN <= 2

-- 15.	 Write a query to select a random  student from each department.  “using one of Ranking Functions”

select top(3) *
from Student
order by newid()

select * 
from (select * , DENSE_RANK() over (partition by dept_id order by newid()) as DN
				 from Instructor )as NewTable
where dn = 1


select * 
from (select * , ROW_NUMBER() over (partition by dept_id order by newid()) as RN
				 from Instructor )as NewTable
where RN = 1

