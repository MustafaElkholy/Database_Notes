use ITI

select sum(salary) from Instructor

select min(salary) as minimun, max(Salary) as maximum from Instructor

select count(*), count(s.St_Age), COUNT(s.St_Id),COUNT(s.St_Lname) -- lastname has one row with null value that agg fun will ignore
from Student s

select AVG(St_Age)
from Student

select AVG(ISNULL(st_age,0))
from Student


select sum(salary), Dept_Id
from Instructor
group by Dept_Id


select sum(salary), i.Dept_Id, Dept_Name
from Instructor i inner join Department D
	on i.Dept_Id = d.Dept_Id
group by i.Dept_Id, Dept_Name

select sum(salary), d.Dept_Id, Dept_Name
from Instructor i inner join Department D
	on i.Dept_Id = d.Dept_Id
group by d.Dept_Id, Dept_Name

select avg(st_age), St_Address, Dept_Id
from Student 
group by St_Address, Dept_Id

select dept_id, sum(Salary)
from Instructor
group by Dept_Id

select dept_id, sum(Salary)
from Instructor
where Salary>3000
group by Dept_Id


select dept_id, sum(Salary)
from Instructor
group by Dept_Id
having sum(Salary)>100000
 
-- مش لازم اعمل جروب باالأجريجيت اللي موجودة في السيليكت هنا مثلا هعمل جروب باي بان عدد الانستراكتور اكبر من 2 مثلا في كل ديبارتمينت
select dept_id,sum(Salary)
from Instructor I
group by Dept_Id
having COUNT(i.Ins_Id)>2

-- هنا انا بس عملتها للمعلومية عشان اتأكد ان الكويري صح
select dept_id,COUNT(i.Ins_Id), sum(Salary)
from Instructor I
group by Dept_Id
having COUNT(i.Ins_Id)<6

select i.Ins_Degree, sum(Salary)
from Instructor I
group by Ins_Degree

----------------------------
-- Subqueries

select *
from Student
where St_Age > (select AVG(St_Age) from Student) 

select *, (select COUNT(St_Id) from Student)
from Student

-- find the names of departments that have students in
select d.Dept_Name
from Department D
where Dept_Id in (select distinct Dept_Id from Student where Dept_Id is not null)

-- find the names of departments that  don't have students in
select d.Dept_Name
from Department D
where Dept_Id not in (select distinct Dept_Id from Student where Dept_Id is not null)

-- better performance 
-- if we can write a query in diffrent way than subquery we must do this for performence 
select distinct d.Dept_Name
from Department D inner join Student S
on d.Dept_Id = s.Dept_Id

-- union
-- union all
select St_Fname 
from Student
union all
select Ins_Name
from Instructor
order by St_Fname


-- union => distinct values only of the two tables(unique values)
select St_Fname 
from Student
union 
select Ins_Name
from Instructor

-- intersect means the common unique values of the two tables => اللي موجود في الجدول الأول وشبهه في الجدول التانى بس
select St_Fname 
from Student
intersect 
select Ins_Name
from Instructor

-- except
-- اللي موجود فى الجدول الأول بس مش موجود فى الجدول التانى

select St_Fname 
from Student
except 
select Ins_Name
from Instructor