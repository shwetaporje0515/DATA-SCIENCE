/*------------------------------------------ WINDOW FUNCTIONS -----------------------------------*/

/*
WINDOW FUNCTION : IT IS AN ADVANCED SQL TOOL PERFORMING A CALCULATION FOR EVERY RECORD IN THE DATA SET USING OTHER RECORDS ASSOCIATED WITH THE SPECIFIED ONE FROM THE TABLE
				  SHOWS ROW WISE CALCULATIONS/VALUES
                  'OVER' USED TO CREATE WINDOW
                  
CLASSIFICATION : AGGREGATE WINDOW FUNCTION
				 NON-AGGREGATE WINDOW FUNCTION
                 
		AGGREGATE WINDOW FUNCTION : SUM, COUNT, AVG, MIN, MAX
		NON-AGGREGATE WINDOW FUNCTION : RANKING FUNCTION, ANALYTIC FUNCTION
        
        RANKING FUNCTION : ROW-NUMBER, RANK, DENSE RANK
		ANALYTIC FUNCTION : LEAD, LAG, FIRST VALUE
        
DRAWBACK ? : OUTPUT IS TEMPORARY AND CANNOT BE USED FURTHER AND WE OVERCOME THE DRWBACK USING CTE FUNCTION
*/

use ds_batch20;
show tables;

select * from emp1;

/*
SYNTAX :
SELECT * , FUNCTION() OVER() FROM TABLE_NAME;

FUNCTION()
			AGGREAGATE(SUM, AVG, COUNT, MIN, MAX)
            RANKING(ROW_NUMBER, RANK, DENSE_RANK)
            ANALYTIC(LEAD, LAG, FIRST_VALUE)
            
CLAUSE()
			PARTITION BY
            ORDER BY
*/

/*--------------------------------- AGGREGATE FUNCTION FOR DIFFERENT CLAUSES -------------------------------------*/

select sum(salary) as total_salary from emp1;

select *, sum(salary) as total_salary from emp1;                 /*WILL GIVE ERROR WE WANT SINGLE VALUE SO CANT INCLUDE ALL COLUMNS*/

select sum(salary) over() as total_salary from emp1;             /*single value but we are getting rowwise*/

select *, sum(salary) over() as total_salary from emp1;

select *, sum(salary) over(partition by deptid) as total_salary from emp1;      					/* WE WILL GET DEPT WISE TOTAL SALARY*/

select *, sum(salary) over(partition by deptid order by salary) as total_salary from emp1;        /*DEPT WISETOTALSALARY WITH ASCENDING ORDER OF SALARY*/

select *, sum(salary) over(partition by deptid order by salary desc) as total_salary from emp1;    /*DEPT WISE TOTAL SALARY WITH DESCENDING ORDER OF SALARY*/

select *, sum(salary) over(order by salary desc) as total_salary from emp1;    						/*IN ASCENDING ORDER AND SALARY WILL GET ADD BY ONE DOWNWARDS*/





select avg(salary) as avg_salary from emp1;

select *, avg(salary) as avg_salary from emp1; 

select avg(salary) over() as avg_salary from emp1;

select *, avg(salary) over() as avg_salary from emp1;

select *, avg(salary) over(partition by deptid) as avg_salary from emp1;      	

select *, avg(salary) over(partition by deptid order by salary) as avg_salary from emp1;	

select *, avg(salary) over(partition by deptid order by salary desc) as avg_salary from emp1;    

select *, avg(salary) over(order by salary desc) as avg_salary from emp1;    						


/* MIN MAX FUN AT HOME*/



/* ----------------------------- ROW FUNCTION FOR DIFFERENT CLAUSES --------------------------------*/

select *, row_number() over() as row_num from emp1;

select row_number() over() as row_num, id, name, deptid,salary from emp1;

select row_number() over(order by id desc) as row_num, id, name, deptid,salary from emp1;

select row_number() over(order by name) as row_num, id, name, deptid,salary from emp1;

select row_number() over(order by name desc) as row_num, id, name, deptid,salary from emp1;

select row_number() over(order by deptid) as row_num, id, name, deptid,salary from emp1;

select row_number() over(order by salary) as row_num, id, name, deptid,salary from emp1;

select row_number() over(order by salary desc) as row_num, id, name, deptid,salary from emp1;





/* ----------------------------- RANKING FUNCTION FOR DIFFERENT CLAUSES --------------------------------*/
/*WITHIN RANK FUNCTION WE CANNOT GIVE ANY ARGUMENT*/

select *, rank() over() as rank_num from emp1;

select *, rank() over(partition by deptid) as rank_num from emp1;

select *, rank() over(order by deptid) as rank_num from emp1;

select *, rank() over(order by deptid desc) as rank_num from emp1;

select *, rank() over(order by salary) as rank_num from emp1;

select *, rank() over(order by salary desc) as rank_num from emp1;

select *, rank() over(partition by deptid order by salary desc) as rank_num from emp1;



/* -----------------------------DENSE-FUNCTION FOR DIFFERENT CLAUSES --------------------------------*/

select *, dense_rank() over(order by salary desc) as rank_num from emp1;

select *,dense_rank() over(order by deptid desc) as rank_num from emp1;

select *, rank() over(order by salary) as rank_num from emp1;

select *, rank() over(order by salary desc) as rank_num from emp1;

select *, rank() over(partition by deptid order by salary desc) as rank_num from emp1;
