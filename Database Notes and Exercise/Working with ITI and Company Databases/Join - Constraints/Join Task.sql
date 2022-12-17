use Company_SD

select D.Dnum, d.Dname, E.Fname
from Departments D, Employee E
where e.SSN = d.MGRSSN

select D.Dname , p.Pname
from Project P , Departments D
where p.Dnum = d.Dnum
group by d.Dname, p.Pname

select D.* , E.Fname
from Dependent D, Employee E
where D.ESSN = E.SSN

select p.Dnum, p.Pname, P.Plocation
from Project P
where p.Plocation in ('Nasr City','Zaied City')

-- Projects full data of the projects with a name starts with "a" letter
select *
from Project P
where p.Pname like 'a%'

-- Display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select E.Fname 
from Employee E
where e.Dno = 30 and e.Salary between 1000 and 2000

--Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
select e.Fname , p.Pname , w.Hours
from Employee e, Project p , Works_for W 
where e.Dno = 10 and e.SSN = w.ESSn and p.Pnumber = w.Pno and w.Hours >= 10

select e.Fname , p.Pname , w.Hours
from Employee e, Project p , Works_for W 
where e.Dno = 10 and e.SSN = w.ESSn and p.Pnumber = w.Pno and w.Hours >= 10 and p.Pname = 'Al Rabwah'

-- Find the names of the employees who directly supervised with Kamel Mohamed
select N.Fname as Name, S.Fname as Supervisor
from Employee N , Employee S
where s.SSN = N.Superssn and s.Fname = 'Kamel' and s.Lname = 'Mohamed'
 
 -- Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select E.Fname, p.Pname
from Employee E join Works_for W
on e.SSN = w.ESSn
join Project P 
on w.Pno = p.Pnumber
order by p.Pname

select E.Fname, p.Pname
from Employee E , Project P , Works_for W
where e.SSN = w.ESSn and w.Pno = p.Pnumber
order by p.Pname

-- For each project located in Cairo City , find the project number, the controlling department name ,
-- the department manager last name ,address and birthdate.
select S.Lname , s.Address ,s.Bdate ,p.Pnumber, p.Pname,p.Dnum
from Employee S, Departments D , Project P
where d.MGRSSN = s.SSN and d.Dnum = p.Dnum
and p.City = 'Cairo'

--Display All Data of the mangers

select e.*
from Employee E , Departments D
where d.MGRSSN = e.SSN

--Display All Employees data and the data of their dependents even if they have no dependents
select E.* , d.*
from Employee E left outer join Dependent D
on d.ESSN = e.SSN

insert into Employee  values ('Mustafa', 'Elkholy',102672,1-1-1998,'Alhamoul - Meouf','M',9000,112233,30)

update Employee
set Bdate = '01-01-1998'
where SSN = 102672


insert into Employee  (Fname,Lname,SSN,Bdate,Address,Sex,Dno) values ('Ali', 'Mazen',102020,'12-20-1998','Menouf','M',30)

insert into Employee(Fname,Lname,SSN,BDATE,Address,Sex,Dno) values('Rasha','Ahmed',102660,'11-14-1980','Alex','F',30)

insert into Departments values ('DEPT IT',100,112233,'1-11-2006')

select * from Departments