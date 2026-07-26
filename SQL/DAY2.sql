use ds_batch20;
show tables;
desc student;

alter table student
add phone_no bigint;
desc student;

alter table student
drop column phone_no;
desc student;

alter table student
rename column city to phone_no;
desc student;

alter table student
modify phone_no bigint;
desc student;

alter table student
rename to student1;
desc student1;

/* ------------------------------------------------------ DML -----------------------------------------------------------------------------------------------------

INSERT
UPDATE
DELETE
*/

insert into student1
             values(101, 'ankur', 40, 9958666004);
select * from student1;

insert into student1(name, id, phone_no, age)
             values('Kedar', 102, 1234567890, 22);
select * from student1;

insert into student1(name, id, age)
             values('Pranav', 103, 22);
select * from student1;

insert into student1
             values(104, 'Sonika', 23, 9324567809),
                   (105, 'Suraj', 22, 9945666004),
                   (106, 'Archana', 23, 8958666004),
                   (107, 'Jonathan', 22, 9958777004),
                   (108, 'Krishna', 24, 9638666004);
select * from student1;

/* TRUNCATE COMMAND
SYNTAX: 
TRUNCATE TABLE TABLE_NAME;
*/

truncate table student1;
select * from student1;

create table employee(id int,
                      name varchar(50),
                      age int,
                      city varchar(50),
                      salary int);
show tables;
desc employee;

insert into employee
             values(101, 'Ankur', 23, 'Pune' , 10000),
                   (102, 'Kedar', 22, 'Pune', 12345678 ),
                   (103, 'Pranav', 23, 'Nasik', 23415167),
                   (104, 'Sonika', 23, 'Pune', 34356780),
                   (105, 'Suraj', 22, 'Latur', 45877655),
                   (106, 'Archana', 23, 'Chennai', 456367788),
                   (107, 'Jonathan', 22, 'Pune', 342685645),
                   (108, 'Krishna', 24, 'Burhanpur', 543297743);
select * from employee;

set sql_safe_updates = 0;

/* UPDATE COMMAND  
SYNTAX:
UPDATE  TABLE_NAME
SET COLUMN1 = VALUE1, COLUMN2 = VALUE2,........
WHERE CONDITION1,CONDITION2,.......;
*/

update employee
set city = 'Pune'
where id = 105;
select * from employee;

update employee
set salary = 20000000
where id = 107 and city = 'Pune';
select * from employee;

update employee
set salary = 20000000, city = 'Agra'
where age = 24;
select * from employee;

update employee
set salary = 20000000, city = 'Agra'
where age = 23 or city= 'Pune' ;
select * from employee;

set sql_safe_updates = 1;
