-- Oracle(DBMS) - version(21C) -xe(databaseëª?)
-- user(scott) - ?…Œ?´ë¸?.
-- Structured Query Language (SQL)
SELECT studno, name -- ì¹¼ëŸ¼ëª?(? „ì²?)
FROM STUDENT; -- ?…Œ?´ë¸?.

-- 1. professor ?…Œ?´ë¸?. ? „ì²? ì»¬ëŸ¼ ì¡°íšŒ.
SELECT *
FROM student;

-- 2. student ?…Œ?´ë¸?. ?•™?ƒë²ˆí˜¸, ?´ë¦?, ?•™?…„
SELECT studno, name, grade
FROM STUDENT;

--?ˆ™? œ?™„ë£Œí•¨.(?—°?Šµë¬¸ì œ 3)
select name || '?˜ ?•„?´?””?Š” ' || id as "? „ì²´ì„¤ëª?" -- ë³„ì¹­(alias) as?Š” ?ˆ?œ¼?‚˜ ?—†?œ¼?‚˜
       ,grade "?•™?…„"                           -- || ?—°ê²? ?—°?‚°?
from student;
-- James Seo?˜ ?•„?´?””?Š” 75true ?´ê³? 4?•™?…„ ?…?‹ˆ?‹¤. -> alias (?•™?…„?„¤ëª?)

select name || '?˜ ''?•„?´?””''?Š” ' || id || ' ?´ê³? ' || grade || '?•™?…„?…?‹ˆ?‹¤.' 
       as "?•™?…„?„¤ëª?" --ë³„ì¹­(alias)
from student;

select ename || '''s  sal is  $' || sal as "Name And Sal"
from emp;
-- James seo?˜ '?•„?´?””'?Š” 75true ?´ê³? 4?•™?…„?…?‹ˆ?‹¤.
select  distinct name, grade --distinct : ì¤‘ë³µ?œ ê°? ? œê±? ë°? ì¶œë ¥
from student;

select *
from emp;

select name || '''s ID: ' || id || ', WEIGHT is ' || weight || 'Kg' as "ID AND WEIGT"
from student;

select ename || '(' || JOB || '), ' || ename ||'''' ||  JOB || '''' as "NAME AND JOB"
from emp;

--WHERE
SELECT *
FROM student
WHERE weight between 60 and 70 -- weight >= 60 AND weight <= 70
AND deptno1 in (101, 201); -- !=, <>

select *
from student
where deptno2 is not null;

--ë¹„êµ?—°?‚°? ?—°?Šµ1) emp?…Œ?´ë¸? ê¸‰ì—¬ 3000ë³´ë‹¤ ?° ì§ì›
select *
from emp;

select *
from emp
where sal > 3000;

--ë¹„êµ?—°?‚°? ?—°?Šµ2) emp?…Œ?´ë¸? ë³´ë„ˆ?Š¤ ?ˆ?Š” ì§ì›
select *
from emp
where comm is not null;

--ë¹„êµ?—°?‚°? ?—°?Šµ3) student?…Œ?´ë¸? ì£¼ì „ê³µí•™ê³?: 101, 102, 103?¸ ?•™?ƒ.
SELECT *
from student
where deptno1 in (101, 102, 103);

--AND / OR
--if(sal > 100 || height > 170)
select studno
      ,name
      ,grade
      ,height
      ,weight
from student
where (height> 170
or   weight > 60)
and (grade = 4 or height > 150); --?š°?„ ?ˆœ?œ„ andê°? ì¡°ê¸ˆ ?” ?†’?Œ

--ê¸‰ì—¬ê°? 2000 ?´?ƒ?¸ ì§ì›, ì»¤ë?¸ì…˜(ê¸‰ì—¬ + ì»¤ë?¸ì…˜)
select ename
      ,sal
      ,comm
from emp
where (sal + comm) >= 2000
or sal >= 2000;

--êµìˆ˜ -> ?—°ë´‰ì´ 4000 ?´?ƒ?¸ êµìˆ˜?“¤, (pay * 12) + (bonus * 3)
select profno
      ,name
      ,pay
      ,bonus
      ,pay * 12 as total_1
      ,pay * 12 + bonus * 3 as total_2
from professor
where (pay * 12 >= 3000 and bonus is null)
or (pay * 12 + bonus * 3 >= 3000 and bonus is not null)
order by 5; --order by(? •? ¬ê¸°ì?). col?ˆœë²ˆìœ¼ë¡œë„ ê°??Š¥

--ë¬¸ì?—´ like?—°?‚°?
select *
from student
where name like '%on____%';

--
select profno
      ,name
      ,pay
      ,bonus
      ,hiredate
from professor
where hiredate > to_date('1999-01-01', 'rrrr-mm-dd')
order by hiredate; --1970.01.01

--?•™?ƒ?…Œ?´ë¸?, ? „?™”ë²ˆí˜¸(02, 03, 051, 052, 053..)
--ë¶??‚°ê±°ì£¼,(051)
select name
      ,tel
from student
where tel like '051%';

--?´ë¦? M?œ¼ë¡? ?‹œ?‘?•˜ë©´ì„œ 8ê°? ?´?ƒ?¸ ?‚¬?Œë§? ì¡°íšŒ
select name
from student
where name like '%M________%';

--ì£¼ë?¼ë²ˆ?˜¸ 10?›”?‹¬?— ?ƒœ?–´?‚œ ?‚¬?Œì¡°íšŒ
select name
      ,jumin
      ,birthday
from student      
where birthday like '%__10%';