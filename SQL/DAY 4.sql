/* --------------------------------------------------------------- DQL COMMANDS ---------------------------------------------------------------------------*/
use ds_batch20;
show tables;

truncate employee;
select * from employee;

insert into employee
             values(101, 'Ankur', 23, 'Pune' , 10000),
                   (102, 'Kedar', 22, 'Pune', 12345678 ),
                   (103, 'Pranav', 23, 'Nasik', 23415167),
                   (104, 'Sonika', 23, 'Pune', 34356780),
                   (105, 'Suraj', 22, 'Latur', 45877655),
                   (106, 'Archana', 23, 'Chennai', 456367788),
                   (107, 'Jonathan', 22, 'Pune', 342685645),
                   (108, 'Krishna', 24, 'Burhanpur', 543297743);

select * from employee;   /* TO RRETRIEVE ALL DATA FROM TABLE */



select id, name, salary from employee;

select distinct city from employee;

select id, name from employee
where city = 'Pune';

select name, age from employee
where age>22;

select name, city from employee
where city ='Pune' or city= 'Nasik';

select name, city from employee
where city in ('Pune', 'Nasik');

select name, city from employee
where city not in ('Pune', 'Nasik');

select * from employee
where name like 'A%';

select * from employee
where name like '%A';

select * from employee
where name like '%A%';

select * from employee
limit 3;

select * from employee
limit 1,1;

select * from employee
limit 4,1;

select * from employee
order by salary;

select * from employee
order by salary asc;

select * from employee
order by salary desc;

select * from employee                     /* HIGHEST SALARY  */
order by salary desc
limit 1;

select * from employee                     /* LOWEST SALARY  */
order by salary asc
limit 1;

select * from employee                     /* 4TH, 5TH, 6TH  HIGHEST SALARY  */
order by salary desc
limit 3,3;

select * from employee
where city = 'Pune'
order by salary desc
limit 1;


/* ---------------------------------------------------- AGGREGATE FUNCTIONS ---------------------------------------------------------------------------------*/

select count(*) from employee;

select count(*) as no_of_employees from employee;

select count(*) as no_of_employees_Pune from employee
where city = 'Pune';

select sum(salary) as total_salary from employee;

select sum(salary) as total_salary from employee
where city = 'Pune';

select avg(salary) as average_salary from employee;

select avg(salary) as average_salary from employee
where city = 'Pune';

select max(salary) as max_salary from employee;

select max(salary) as max_salary from employee
where city = 'Pune';

select min(salary) as min_salary from employee;

select min(salary) as min_salary from employee
where city = 'Pune';

/* ----------------------------------------------------------------- GROUP BY ----------------------------------------------------------------------------------*/

/*  NO OF EMPLOYEES FROM EACH CITY */

select city, count(*) from employee
group by city;

select city, count(*) from employee
group by city
order by count(*) asc;

select city, count(*) from employee
group by city
order by 2 asc;

/* ------------------------------------------------------------ HAVING CLAUSE ------------------------------------------------------------------------------------*/

select city, sum(salary) from employee
group by city
having sum(salary) >40000000;

select city, sum(salary) from employee
group by city
having sum(salary) >40000000
order by 2;

select city, sum(salary) from employee
group by city
having sum(salary) >40000000
order by 2
limit 1;

select city, sum(salary) from employee
where city != 'Latur'
group by city
having sum(salary) >40000000
order by 2
limit 1;
