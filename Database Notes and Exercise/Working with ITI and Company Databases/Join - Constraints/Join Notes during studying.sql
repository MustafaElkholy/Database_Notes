use ITI

-- cross join
select St_Fname, Dept_name from Student , Department
select St_Fname, Dept_name from Student cross join Department

-- inner join
select St_Fname, Dept_name from Student inner join Department
on Department.Dept_Id = Student.Dept_Id

select st_fname , dept_name  from Student , Department
where Department.Dept_Id = Student.Dept_Id

select st_fname , dept_name ,Dept_Id from Student , Department --  wrong because the two tables has the same coulomn name (Ambiguous column name)
where Department.Dept_Id = Student.Dept_Id

select st_fname ,Student.Dept_Id, dept_name  from Student , Department
where Department.Dept_Id = Student.Dept_Id

-- student name and the whole information of his department

select st_fname ,D.*  from Student S , Department D
where D.Dept_Id = S.Dept_Id
order by Dept_Location

select st_fname ,s.St_Address , Dept_Name  from Student S , Department D
where D.Dept_Id = S.Dept_Id and s.St_Address = 'Cairo'
order by Dept_Name

select st_fname ,s.St_Address , Dept_Name  from Student S inner join Department D
on D.Dept_Id = S.Dept_Id and s.St_Address = 'Cairo' and s.St_Age>20

-- outer join
select St_Fname, Dept_Name from Student left outer join Department
on Student.Dept_Id = Department.Dept_Id

select St_Fname, Dept_Name from Department left outer join Student
on Student.Dept_Id = Department.Dept_Id

select St_Fname, Dept_Name from Department full outer join Student
on Student.Dept_Id = Department.Dept_Id

-- self join
select * from Student

select N.St_Fname, s.St_Fname from Student N, Student S
where s.St_Id = N.St_super


select N.St_Fname , s.*
from Student N, Student S
where S.St_Id = n.St_super 

-- join multiple tables

select s.St_Fname, c.Crs_Name, sc.Grade
from Student S, Course C , Stud_Course SC
where s.St_Id = sc.St_Id and c.Crs_Id = SC.Crs_Id

-- join multi table with inner join

select s.St_Fname, c.Crs_Name, sc.Grade
from Student S inner join Stud_Course SC
on s.St_Id = sc.St_Id 
inner join Course C
on c.Crs_Id = SC.Crs_Id

select s.St_Fname, c.Crs_Name, sc.Grade ,D.Dept_Name
from Student S inner join Stud_Course SC
on s.St_Id = sc.St_Id 
inner join Course C
on c.Crs_Id = SC.Crs_Id
inner join Department D
on s.Dept_Id = D.Dept_Id

select s.St_Fname, c.Crs_Name, sc.Grade ,D.Dept_Name
from Student S inner join Stud_Course SC
on s.St_Id = sc.St_Id 
inner join Course C
on c.Crs_Id = SC.Crs_Id
inner join Department D
on s.Dept_Id = D.Dept_Id
order by grade

-- Join with DML (Update, Delete , insert)
-- update
-- update grades by 10 grades

update Stud_Course
	set Grade+=10

-- update grades of students live in cairo by 10 grades

select s.St_Fname, sc.Grade, s.St_Address
from Student S, Stud_Course Sc
where s.St_Id = sc.St_Id and s.St_Address ='Cairo'

update Stud_Course
set Grade+=10
from Student S, Stud_Course Sc
where s.St_Id = sc.St_Id and s.St_Address ='Cairo'

-- join with delete

delete S
	from Student S left outer join Stud_Course Sc
	on S.St_Id = sc.St_Id
	where s.St_Age is null

delete S
	from Student S left outer join Stud_Course Sc
	on S.St_Id = sc.St_Id where s.St_Address = 'Tanta'

--select * from Student left outer join Stud_Course 
--on Student.St_Id = Stud_Course.St_Id

-----------------------
select * from Student

select ISNULL(s.St_Fname , 'Mustafa')
from Student S

select ISNULL (St_Fname, st_Lname)
from Student

select coalesce (St_Fname, st_Lname, 'No data')
from Student S

select coalesce (St_Fname, st_Lname, st_Address,  'No data') as FirstName
from Student S

select 'StudentName: '+ s.St_Fname +'. '+ ' Age: ' +CONVERT(varchar(3),s.St_Age) as Name  -- there will be null values (null Fname)
from Student S

select 'StudentName: '+ ISNULL(s.St_Fname,'no name') +'. '+ ' Age: ' +CONVERT(varchar(3),s.St_Age) as Name -- here we replace null fname by data
from Student S

select 'StudentName: '+ ISNULL(s.St_Fname,'no name') +'. '+ ' Age: ' +CONVERT(varchar(3),isnull(s.St_Age,0)) as Name -- here we replace null fname by data
from Student S

select CONCAT(St_Fname,'   ', St_Age)
from Student

select * from Student

select * from Student
where  St_Fname like 'Ahme_'

select * from Student
where  St_Fname like '_h%'

select * from Student
where  St_Fname like '%a' -- end with a

select * from Student
where  St_Fname like '%i_' -- الحرف القبل الأخير هيكون (i) 

select * from Student
where  St_Fname like '[ahm]%'

select * from Student
where  St_Fname like '%[%]'

-----
select s.St_Fname,s.St_Age ,s.Dept_Id
from Student S
order by Dept_Id

select s.St_Fname,s.St_Age ,s.Dept_Id
from Student S
order by Dept_Id, St_Age



	
	

