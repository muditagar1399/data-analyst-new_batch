create database AI;
use AI
create table employees_AI(
emp_id int primary key ,
emp_name varchar(40),
emp_job_title char(20),
emp_salary int );

insert into employees_AI(emp_id,emp_name,emp_job_title,emp_salary) values 
(101,'Sunanya','Machine_learning',1000000),
(102,'pratichi','data_analyst',400000);
insert into employees_AI(emp_id,emp_name,emp_job_title,emp_salary) values 
(103,'mudit','AI_ENGINEER',3000000),
(104,'Lokesh','Data_scientist',60000000),
(105,'anirudha','AI_engineer',50000000);
select * from employees_AI;
--aggregate functions 
--numerical data 
--sum
--avg 
--min
--max
--count
--sum

select sum(emp_salary) as total_Salary from employees_AI;
--max
select max(emp_salary) as total_Salary from employees_AI;
--min
select min(emp_salary) as total_Salary from employees_AI;
--average
select avg(emp_salary) as total_Salary from employees_AI;
--count function is counting the number of rows in the data 
--count 
select count(*) as total_count from employees_AI;
--count 
select count(emp_salary) as total_count from employees_AI;
--alter
alter table employees_AI add department char(20);
select * from employees_AI;
--update 
update employees_AI set department='IT' where emp_id=101;
update employees_AI set department='finacne' where emp_id=102;
update employees_AI set department='marketing' where emp_id=103;
update employees_AI set department='DATA' where emp_id=104;
update employees_AI set department='seo' where emp_id=105;

--alter the column name and the data type 
-- renaming column name 
-- this exec renmae is only applicable if you are using ssms 
-- rename is command exec _sp is function 
exec sp_rename 'employees_AI.emp_name','employee_name','COLUMN';
exec sp_rename 'employees_AI.emp_job_title','employee_role','COLUMN';

--renaming the table 
exec sp_rename 'employees_AI','Employee';

--- changing data type using alter 
alter table Employee alter column emp_salary bigint;
alter table Employee alter column employee_name varchar(100);
-- delete and drop
-- drop commands drop the whole column and whole table 
-- delete command delete the rows in the table 
--delete 
delete from Employee where emp_id=105;
select * from Employee;
--drop column 
alter table Employee drop column department;

use AI
create table A(
a_id int ,
a_emp_name char(30));
insert into A values (101,'harshit');
select * from A;
-- use drop command to drop the whole table 
drop table A;
