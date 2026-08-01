/*---------------------------------------------------SUB QUERY-------------------------------------------*/

use ds_batch20;
show tables;

select * from emp1;

/*-------SELECT SUB QUERY--------*/

select * from emp1
where salary < (select avg(salary) from emp1);

/*-------INSERT SUB QUERY--------*/

create table top_employees
as 
(select * from emp1 
where id in ( select id from emp1 where salary > 70000 ));

select * from top_employees;

/*-------UPDATE SUB QUERY--------*/

create table emp1_d
as select * from emp1;              /*DUPLICATE TABLE*/

select * from emp1_d;

update emp1
set salary = salary*0.5             /* DECREMENT IN SALARY */
where salary in (select salary from emp1_d where salary > 60000); 

select * from emp1;

/*-------DELETE SUB QUERY--------*/

delete from emp1
where salary in (select salary from emp1_d where salary > 50000);

select * from emp1; 

/* IMPORTING CSV FILES FROM FILE MANAGER : GO TO LEFT SIDE SCHEMA THEN CLICK ON TABLES 
THEN RIGHT CLICK ON TABLES AND THEN GO TO TABLE DATA IMPORT WIZARD AND THEN PROCESS FURTHER*/

show tables;                         /* IMPORTED FROM FILE (OLD) */
select * from sales_data_sample;               

