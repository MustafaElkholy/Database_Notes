-- Rankning Functions
-- هنا عمل عمود جديد يرتب فيهم الطلبة حسب عمر كل واحد ترتيبا من الأصغر للأكبر
select *
from (select *, ROW_NUMBER() over (order by [St_Age]) as Rn from Student ) as newTable
-- select the third youngest student
--هنا رتب بال الرو نامبر حسب ال سن بتاع كل طالب وادي رانك فى عمود جديد فلما أقوله طلعلي اصفر تالت طالب هيطلعلي التالت في الرانك 
-- بدون اعتبار لو عمر التالت ده متكرر اكتر من مرة ولا لأ

select *
from (select *, ROW_NUMBER() over (order by [St_Age]) as Rn from Student ) as newTable
where Rn = 5

---------------------------------------------------
-- هنا عمل عمود جديد يرتب فيهم الطلبة حسب عمر كل واحد ترتيبا من الأصغر للأكبر لكن عمل اعتبار ان كل طالب السن متكرر بقو رقم واحد

select *
from (select *, DENSE_RANK() over (order by [St_Age]) as DR from Student ) as newTable

-- هنا انا قلتله هاتلي الطالب رقم 5 من حيث اصغر سن طلع عندي اتنين طلاب نفس السن فدول رقم 5 في الترتيب من اكبر سن
select *
from (select *, DENSE_RANK() over (order by [St_Age]) as DR from Student ) as newTable
where DR = 5

-- هنا انا قلتله يرتبهوملي حسب ال  row 
-- وكمان حسب ال dense 

select *
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR
			   from Student ) as NewTable

select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR
			   from Student ) as NewTable
where  DR <= 5

select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR
			   from Student ) as NewTable
where NR= 5 and DR = 5


-- Top 5 من غير تكرار
select *
from (select *, ROW_NUMBER() over (order by [St_Age]) as Rn from Student ) as newTable
where Rn <= 5

-- Top 5 لكن مع التكرار
select *
from (select *, DENSE_RANK() over (order by [St_Age]) as DR from Student ) as newTable
where DR <= 5

--------------------------------
select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR,
			   NTILE(3)     over (order by [St_Age]) as NT,
			   RANK()		over (order by st_age  ) as R
 			   from Student ) as NewTable

-- select the firth groop
select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR,
			   NTILE(3)     over (order by [St_Age]) as NT,
			   RANK()		over (order by st_age  ) as R
 			   from Student ) as NewTable
			   where Nt = 1

-- select with Rank
-- Rank skip the rank if there is tie
select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR,
			   NTILE(3)     over (order by [St_Age]) as NT,
			   RANK()		over (order by st_age  ) as R
 			   from Student ) as NewTable
			   where R = 6 -- Error there is now value with 6 because it was skipped

select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR,
			   NTILE(3)     over (order by [St_Age]) as NT,
			   RANK()		over (order by st_age  ) as R
 			   from Student ) as NewTable
			   where R = 7


-- work with partition 
select*
from(select *, ROW_NUMBER() over (order by [St_Age]) as NR ,
			   DENSE_RANK() over (order by [St_Age]) as DR,
			   NTILE(3)     over (order by [St_Age]) as NT,
			   RANK()		over (order by st_age  ) as R
 			   from Student ) as NewTable
select*
from(select *, ROW_NUMBER() over ( partition by  st_address order by St_Age  ) as NR ,
			   DENSE_RANK() over (order by [St_Age] )  as DR,
			   NTILE(3)     over (order by [St_Age]) as NT,
			   RANK()		over (order by st_age  ) as R
 			   from Student ) as NewTable
--------------------------------------------------------------------------------------

---------------
----------------
---------------
---------- The Actual Notesssssssssssssssss--------------------------
select * ,  ROW_NUMBER() over (order by st_age desc) as RN 
from Student  

select *, DENSE_RANK() over (order by [St_Age] desc) as DR
from Student

-- using where with ranking functions
-- في ال2 كويريز اللي فوق دول لو حطيت شرط مثلا طلعلي لو ال دي آر تساوي 2 هيطلع أيرور عشان ال هوير بتتنفيذ قبل السيليكت 
-- فهحط الكويريزز دي في ساب كويري

select *
from (select * ,  ROW_NUMBER() over (order by st_age desc) as RN 
from Student) as newTable
where RN <= 2    

select *
from (select *, DENSE_RANK() over (order by [St_Age] desc) as DR
from Student) as newTable
where DR <= 2

-- using rankin functions with partition by
select *
from (select * ,  ROW_NUMBER() over (partition by dept_id order by st_age desc) as RN 
from Student) as newTable

select *
from (select *, DENSE_RANK() over (partition by dept_id order by [St_Age] desc) as DR
from Student) as newTable

-- partition with where
-- هنا لما يقولي هاتلي بيانات اعلي طالب سنا فى كل قسم
select *
from (select * ,  ROW_NUMBER() over (partition by dept_id order by st_age desc) as RN 
from Student) as newTable
where RN = 1
-- لما يقولي هات بيانات اعلى طلبة سنا فى كل قسم مع التكرار
select *
from (select *, DENSE_RANK() over (partition by dept_id order by [St_Age] desc) as DR
from Student) as newTable
where dr = 1


-- ntile()

select * , NTILE(4) over (order by st_age ) as NT from Student

select * , NTILE(4) over (partition by dept_id order by st_age ) as NT from Student

select *
from (select * , NTILE(4) over (partition by dept_id order by st_age ) as NT 
from Student) as newTable
where NT = 1

