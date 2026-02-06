--1번
select employee_id, last_name, salary, department_id 
from employees
where salary >= 7000 
and salary <= 12000
and lower(last_name) like '%h%';

--2번
select employee_id, first_name, job_id, salary, department_id
from employees
where department_id >= 50
and department_id <= 60
and salary > 5000;

--3번
select *
from employees;


--4번
select *
from departments;

select *
from locations;

select department_id, department_name, city
from departments d
join locations l on d.location_id = l.location_id;

--5번
select employee_id, last_name, job_id
from employees
where job_id like '%IT%';   --( select job_id
--              from employees
--              where jpb_id = 'IT');


--6번
select employee_id,
       first_name, last_name,
       email, phone_number,
       to_char(hire_date, 'dd/mon/yy') "HIRE_DATE", 
       job_id
from employees
where job_id like 'ST_CLERK';

--7번
SELECT last_name, job_id, salary, commission_pct
from employees
where commission_pct > 0
order by 3 desc;

--8번
create table prof(
    PROFNO NUMBER(4),
    NAME VARCHAR2(15) not null,
    ID VARCHAR2(15) not null,
    HIREDATE date default sysdate,
    PAY NUMBER(4)
    );
    
--9번-(1)
insert into prof(profno, name, id, hiredate, pay)
values(1001, 'Mark', 'm1001', '07/03/01', 800);

insert into prof(profno, name, id, hiredate, pay)
values(1003, 'Adam', 'a1003', '11/03/02', null);

select *
from prof;
--9번-(2)
update prof
set pay = 1200
where profno = 1001;

select *
from prof;

--9번-(3)
delete 
from prof 
where profno = 1003;

select *
from prof;

--10번-(1)
--alter table prof add constraint primary key(profno);

--10번-(2)
alter table prof add (GENDER char(3));

select *
from prof;

--10번-(3)
alter table prof modify name varchar2(20);

select *
from prof;
