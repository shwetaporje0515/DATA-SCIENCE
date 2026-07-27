use ds_batch20;
select * from employee;

/*
DELETE COMMAND:
SYNTAX:
DELETE FROM TABLE_NAME
WHERE CONDITION;
*/

set sql_safe_updates = 0;

delete from employee
where age>23;
select * from employee;

/* MYSQL CONSTRAINTS:
SYNTAX:
CREATE TABLE TABLE_NAME( COLUMN1 DATATYPE CONSTRAINT,
                         COLUMN2 DATATYPE CONSTRAINT,
                         COLUMN3 DATATYPE CONSTRAINT,
                         ---------------------------);
CONSTRAINTS:

> NOT NULL - NULL VALUES ARE NOT ALLOWED
> UNIQUE - DUPLICATE VALUES ARE NOT ALLOWED
> DEFAULT - ALLOWS TO SPECITY DEFAULT VALUE FOR ACOLUMN
> PRIMARY KEY - UNIQUELY IDENTIFIES EACH ROW IN THE TABLE
> FOREIGN KEY - MAINTAINING THE LINK BETWEEN TWO TABLE
> CHECK - TO APPLY CONDITIONS
*/

create table employee1( emp_id int primary key,
                        first_name varchar(50) not null,
                        last_name varchar(50),
                        city varchar(50) default "Pune",
                        age int check(age>=21),
                        mobile_no bigint not null unique);

desc employee1;

insert into employee1 values ( 101, 'Ankur', 'Varshney', 'Ghaziabad', 40, 9958666004);
select * from employee1;                        

insert into employee1 values ( 101, 'Ankur', 'Varshney', 'Ghaziabad', 40, 9958666003);   /* DUPLICATE VALUE IS NOT ALLOWED IN PRIMARY KEY */
select * from employee1;

insert into employee1 ( first_name, last_name, city, age, mobile_no)
               values ( 'Ankur', 'Varshney', 'Ghaziabad', 40, 9958666005);                /* NULL VALUE IS NOT ALLOWED IN PRIMARY KEY */
select * from employee1;

insert into employee1 ( emp_id, first_name, last_name, age, mobile_no)
               values ( 102,'Ankur', 'Varshney', 40, 9958666005);                /* IF VALUE NOT SPECIFIED DEFAULT VALUE WILL COME */
select * from employee1;

insert into employee1 values ( 103, 'Ankur', 'Varshney', 'Ghaziabad', 20, 9958666008);   /* AGE BELOW 21 IS NOT ALLOWED */
select * from employee1;

insert into employee1 values ( 103, 'Ankur', 'Varshney', 'Ghaziabad', 23, 9958666008);   
select * from employee1;

insert into employee1 values ( 104, 'Ankur', 'Varshney', 'Ghaziabad', 23, 9958666008);  /* DUPLICATE VALUES ARE NOT ALLOWED IN UNIQUE */ 
select * from employee1;

/* 
FOREIGN KEY
*/

create table department( dept_id int primary key,
                         dept_name varchar(30) );
desc department;

insert into department values (1, 'HR'),
                              (2, 'MR'),
                              (3, 'DA'),
                              (4, 'DS'),
                              (5, 'ME');
                              
 select * from department;
 
 create table emp( emp_id int primary key,
                   emp_name varchar(50) not null,
                   dept_id int,
                   foreign key (dept_id) 
                   references department(dept_id));
                   
insert into emp values( 101, 'ankur', 4),
                      ( 102, 'amit', 2),
                      ( 103, 'ankit', 3),
                      ( 104, 'ashish', 5),
                      ( 105, 'hitesh', 2);
                      
select * from emp;      

delete from department
where dept_id = 2;

drop table emp;
drop table department;
                         
                         
create table department( dept_id int primary key,
                         dept_name varchar(30) );
desc department;

insert into department values (1, 'HR'),
                              (2, 'MR'),
                              (3, 'DA'),
                              (4, 'DS'),
                              (5, 'ME');
                              
 select * from department;
 
 create table emp( emp_id int primary key,
                   emp_name varchar(50) not null,
                   dept_id int,
                   foreign key (dept_id) 
                   references department(dept_id)
                   on delete cascade
                   on update cascade);
                   
insert into emp values( 101, 'ankur', 4),
                      ( 102, 'amit', 2),
                      ( 103, 'ankit', 3),
                      ( 104, 'ashish', 5),
                      ( 105, 'hitesh', 2);
                      
select * from emp;      

delete from department
where dept_id = 2;

select * from department;
select * from emp;