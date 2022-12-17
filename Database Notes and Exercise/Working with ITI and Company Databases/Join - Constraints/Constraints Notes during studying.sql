use ITI


create table dept
(
did int primary key,
dname varchar(20)
)

create table emp
( 
eid int  identity, 
ename varchar(20),
eaddress varchar(50) default 'mansoura',
hiredate date default getdate(),
birthdate date,
age as ( year(getdate()) - year(birthdate) ),
sal  int,
overtime int,
netsal as (isnull(sal,0) + isnull(overtime,0) ) persisted, -- driven attribute and saved on harddisk
hour_rate int,
gender varchar(1),
dept_id int,
constraint c1 primary key (eid, ename),
constraint c2 unique(sal),
constraint c3 unique(hour_rate),
constraint c4 check (sal > 1000),
constraint c5 check (eaddress in ('alex', 'cairo','mansoura')),
constraint c6 check (overtime between 100 and 1000),
constraint c7 check (gender = 'M' or gender ='F'),
constraint c8  foreign key (dept_id) references dept(did)
	on delete set NULL on update cascade,

)

-----------------------
-- Here I calculated the age attribute wrong so i dropped it and recreated it again and it worked well.

-- alter table emp drop column age
--alter table emp add age as ( year(getdate()) - year(birthdate) )  

-----------------------

-- Rules

create rule r1 as @x > 1000

sp_bindrule r1 , 'instructor.salary'
-- Now i can change any old value of salary to a value > 1000 and the new values must be > 1000

sp_bindrule r1, 'emp.hour_rate'
-- here i can bind this rule to another coulmn in another table

create default def1 as 7000

sp_bindefault def1 , 'instructor.salary'

-- to delete the default
-- first unbind from every column 
-- then drop default 

sp_unbindefault 'instructor.salary'
drop default def1

-- create new data types

create default def1 as 7000
-- once we had created the rule r1 
-- crate a new data type call newType inherit from int data type
sp_addtype newType,'int'

-- bind r1 and def1 to the new data type newType 
sp_bindrule r1,newType
sp_bindefault def1, newType

-- now we can create a new  table then the newType datatype will take int values that greater than 1000 
-- and if there no value added the default value will be 7000

create table Test
(
id int,
name varchar(20),
salary newType

)




