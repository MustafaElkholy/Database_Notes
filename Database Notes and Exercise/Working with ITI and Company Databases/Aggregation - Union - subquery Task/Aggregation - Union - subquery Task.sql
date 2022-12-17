-- 1.	Display (Using Union Function)
--  The name and the gender of the dependence that's gender is Female and depending on Female Employee
--  And the male dependence that depends on Male Employee.

use Company_SD

select Fname, Sex
from Employee E
where sex = 'F'
union 
select d.Dependent_name, d.Sex
from Dependent D
where sex = 'F'

select Fname, Sex
from Employee E
where sex = 'M'
union 
select d.Dependent_name, d.Sex
from Dependent D
where sex = 'M'

---------------------------------------------------------------------------------------------------------------------------

-- For each project, list the project name and the total hours per week (for all employees) spent on that project.

select p.Pname, sum(w.Hours)
from Project p inner join Works_for W
on w.Pno = p.Pnumber
group by p.Pname

---------------------------------------------------------------------------------------------------------------------------

-- Display the data of the department which has the smallest employee ID over all employees' ID

select *
from Departments D inner join Employee E
on e.Dno = d.Dnum
where e.SSN = (select min(SSN) from Employee)

---------------------------------------------------------------------------------------------------------------------------

-- For each department, retrieve the department name and the maximum, minimum and average salary of its employees.

select d.Dname, max(E.Salary) as MaximumSalary, min(E.Salary) as MinimumSalary 
from Departments D inner join Employee E
on d.Dnum = e.Dno
group by d.Dname

---------------------------------------------------------------------------------------------------------------------------

-- List the last name of all managers who have no dependents.

select Fname, Lname, e.SSN
from Employee E inner join Departments D 
on e.SSN = d.MGRSSN

-- the solution, if he asked for the managers has dependents
select Fname, Lname, e.SSN
from Employee E inner join Departments D 
on e.SSN = d.MGRSSN and e.SSN not in (select distinct ESSN from Dependent)
 
-- if he asked for the managers has dependents
select Fname, Lname, e.SSN
from Employee E inner join Departments D 
on e.SSN = d.MGRSSN and e.SSN  in (select distinct ESSN from Dependent)

--if he asked for the dependents names of the managers

select Fname, Lname, e.SSN, ED.Dependent_name
from Employee E inner join Departments D 
on e.SSN = d.MGRSSN
inner join Dependent ED
on e.SSN = ED.ESSN
where e.SSN  in (select distinct ESSN from Dependent)

---------------------------------------------------------------------------------------------------------------------------

-- For each department if its average salary is less than the average salary of all employees
-- display its number, name and number of its employees

-- هنا بنجيب بيانات الديبارتمينت اللي الافريدج بتاع المرتب للموظفين في كل ديبارتمينت من دول اقل من الافريدج بتاع الموظفين كاملين
-- عشان كدة استخدمت ساب كويري 

select D.Dnum, d.Dname, count(e.SSN)
from Departments D inner join Employee E
on d.Dnum = e.Dno
group by D.Dnum, d.Dname
having AVG(e.Salary) < (select avg(Salary) from Employee)


-- display the average salary of each departments
-- هنا بنجيب الافريدج بتاع المرتب للموظفين في كل ديبارتمينت
select D.Dnum, d.Dname, count(e.SSN), AVG(e.Salary)
from Departments D inner join Employee E
on d.Dnum = e.Dno
group by D.Dnum, d.Dname

---------------------------------------------------------------------------------------------------------------------------

-- Retrieve a list of employees and the projects they are working on ordered by department and
-- within each department, ordered alphabetically by last name, first name.

select E.* , P.*, d.Dname
from Employee E inner join Departments D
on d.Dnum = e.Dno
inner join Project P
on p.Dnum = d.Dnum
order by d.Dname, e.Lname, e.Fname

---------------------------------------------------------------------------------------------------------------------------

-- Try to get the max 2 salaries using subquery

-- two columns 
select 
( select max(Salary)
from Employee E) as _1stMaximumSalary ,
max(Salary) as _2ndMaximumSalary
from Employee E
where Salary not in (select max(salary) from Employee)

select 
( select max(Salary)
from Employee E) as _1stMaximumSalary ,
max(Salary) as _2ndMaximumSalary
from Employee E
where Salary <> (select max(salary) from Employee)

--- try with union but it will be in one column
 
select max(Salary)
from Employee 
union 
select max(Salary)
from Employee E
where Salary <> (select max(salary) from Employee)

---------------------------------------------------------------------------------------------------------------------------


-- Get the full name of employees that is similar to any dependent name

select CONCAT_WS(' ', Fname,Lname) as FullName
from Employee E 
where e.Fname in (select SUBSTRING(Dependent_name,1,5) from Dependent)


---------------------------------------------------------------------------------------------------------------------------

-- 	Display the employee number and name if at least one of them have dependents (use exists keyword).

select e.SSN , e.Fname
from Employee E
where exists (select * from Dependent D where d.ESSN = e.SSN )


-------------------------------------DML------------------------------------

-- 	Try to update all salaries of employees who work in Project ‘AlRabwah’ by 30% 

-- Relation between Employee table and Departments table then with project table
update Employee
set Salary = Salary * 1.3
from Employee E inner join Departments D
on d.Dnum = e.Dno
inner join Project p on p.Dnum = d.Dnum
and p.Pname = 'Al Rabwah'

select Salary
from Employee E inner join Departments D
on d.Dnum = e.Dno
inner join Project p on p.Dnum = d.Dnum
and p.Pname = 'Al Rabwah'

-- Relation between Employee table and Works_for table then with project table
update E
set e.Salary = e.Salary +200
from Employee E inner join Works_for W
on w.ESSn = e.SSN 
inner join Project p on w.Pno = p.Pnumber
and p.Pname = 'Al Rabwah'

---------------------------------------------------------------------------------------------------------------------------

-- Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), 
-- and they give you(your SSN =102672) her position (Dept. 20 manager) 

--a.	First try to update her record in the department table
--b.	Update your record to be department 20 manager.
--c.	Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)


select * from Employee
select  * from Departments

-- noha mohamed with ssn = 968574 managed dnum = 20 , now she will manage dnum = 100 
-- now i'm mustafa elkholy with ssn = 102672 will manage dnum = 20 instead of noha

--1

update Departments
set MGRSSN = 968574 where Dnum = 100

--2
update Departments
set MGRSSN = 102672 where Dnum = 20

-- Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
update Employee
set Superssn = 102672
where ssn = 102660

---------------------------------------------------------------------------------------------------------------------------

-- 
