/*----------------------------------------------------------------------------------TCL-------------------------------------------------------------------------------------------------------------*/

set autocommit = off;

use ds_batch20;
show tables;
set autocommit = off;

create table students (id int, name varchar(50), city varchar(50));
insert into students values(101,'Ankur','Ghazibad');
select * from students;

start transaction;

insert into students values(102,'Archana','pune');
select * from students;
savepoint a;

insert into students values(103,'vivek','pune');
select * from students;
savepoint b;

insert into students values(104,'Krishna','pune');
select * from students;
savepoint c;

insert into students values(105,'Vedika','pune');
select * from sudents;
savepoint d;

rollback to b;
select * from students;

rollback to c;

rollback to a;
select * from students;

rollback to a;
select * from students;

/*----------------------------------------------------------------------------------JOINS--------------------------------------------------------------------------------------------------------*/

/*
JOINS :
LEFT JOIN - ALL DATA OF LEFT TABLE AND COMMON DATA FROM RIGHT TABLE
RIGHT JOIN - ALL DATA OF RIGHT TABLE AND COMMON DATA FROM LEFT TABLE
INNER JOIN - INTERSECTION OF 2 TABLES(COMMON VALUES)
OUTER JOIN - UNION OF 2 TABLES(ALL VALUES)
*/

show tables;

create table emp1 (id int, name varchar(50), deptid int, salary int);
insert into emp1 values(101, 'Ankur', 2, 60000),
					   (102, 'Archana', 3, 70000),
                       (103, 'Aniket', 2, 80000),
                       (104, 'Irshad', 5, 60000),
                       (105, 'Simran', 2, 80000),
                       (106, 'Krishna', 3, 50000),
                       (107, 'Vedika', 5, 30000),
                       (108, 'Sakshi', 2, 90000);
                       
select * from emp1;

create table deppt (id int, deppt_name varchar(50), hod varchar(50));
insert into deppt values(1, 'DS', 'Ankur'),
				        (2, 'DA', 'Ankush'),
                        (3, 'DE', 'Jatin'),
                        (4, 'HR', 'Sonal'),
                        (5, 'SE', 'Raunak');
                  
select * from deppt;

/* INNER JOIN */

select emp1.id, emp1.name, emp1.salary, deppt.id, deppt.deppt_name, deppt.hod
from emp1 inner join deppt
on emp1.deptid = deppt.id;
                  
/* LEFT JOIN */

select emp1.id, emp1.name, emp1.salary, deppt.id, deppt.deppt_name, deppt.hod
from emp1 left join deppt
on emp1.deptid = deppt.id;

/* RIGHT JOIN */

select emp1.id, emp1.name, emp1.salary, deppt.id, deppt.deppt_name, deppt.hod
from emp1 right join deppt
on emp1.deptid = deppt.id;

/* OUTER JOIN */

select emp1.id, emp1.name, emp1.salary, deppt.id, deppt.deppt_name, deppt.hod
from emp1 left join deppt
on emp1.deptid = deppt.id
union
select emp1.id, emp1.name, emp1.salary, deppt.id, deppt.deppt_name, deppt.hod
from emp1 right join deppt
on emp1.deptid = deppt.id;

/*Go through remaining joins too and explore all the tables and use different conditions to check table structure*/
