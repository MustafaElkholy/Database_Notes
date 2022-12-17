use Company_SD

select min(Salary), E.Dno 
from Employee E
group by e.Dno

select count(e.SSN), E.Sex
from Employee E
group by e.Sex

select sum (Salary), e.SSN , e.Address
from Employee E
where Address like '%o'
group by e.SSN , e.Address
having sum(Salary) >= 1000

select sum (Salary), e.Address
from Employee E
where e.Dno in (10,20)
group by e.Address
having sum(Salary) >= 800
