use Company_SD
select * from Employee

select Fname, Lname, Salary, Dno from Employee

select * from Project

select Pname, Plocation,Dnum from Project

select CONCAT_ws(' ', Fname, Lname) as FullName ,  
salary, ( (Salary * 12 * 0.10)) as ANNUALCOMM 
from Employee

select CONCAT_WS (' ', Fname, Lname) as FullName ,
( (Salary * 12 * 0.10)) as ANNUALCOMM,
salary, ( (Salary * 12 ) + (Salary * 12 * 0.10)) as AnnulSalaryWithCommission 
from Employee

select  concat_ws(' ', Fname,Lname) as FullName, Salary from Employee
where Salary > 1000

select  concat_ws(' ', Fname,Lname) as FullName, Salary from Employee
where Salary > 10000

update Employee
set Salary =20000 where SSN = 223344

select  concat_ws(' ', Fname,Lname) as FullName, Salary from Employee
where Sex = 'F'

select * from Departments	

select Dnum, Dname from Departments where MGRSSN =968574

select Pnumber, Pname from Project
where Dnum =10



