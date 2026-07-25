show databases;

/* ---------------------------------------------------- INTRODUCTION --------------------------------------------------------------------------------------*/

/* HGDHGFHGF
XBVNGVJH
BVNBVHN
NBVNHBJ
*/

/* ----------------------------------------------------------------- DDL ---------------------------------------------------------------------------------------

CREATE
ALTER
DROP
TRUNCATE
*/

/* CREATING A DATABASE :
SYNTAX : CREATE DATABASE DATABASE_NAME;  */

create database ds_batch20;
show databases;

/* DELETING A DATABASE :
SYNTAX : DROP DATABASE DATABASE_NAME;  */

drop database ds_batch20;
show databases;

create database ds_batch20;
show databases;

/* CREATING STRUCTURE OF TABLE :
SYNTAX : 
CREATE TABLE TABLE_NAME( COLUMN_1 DATA_TYPE,
                         COLUMN_2 DATA_TYPE,
                         COLUMN_3 DATA_TYPE,
                         ------------------,
                         COLUMN_N DATA_TYPE);
*/

use ds_batch20;

create table student( id int,
                      name varchar(50),
                      age int,
                      city varchar(50));
show tables;
desc student;

/*
ALTER COMMAND :
SYNTAX :
ALTER TABLE TABLE_NAME
----------------------;
ADDING A COLUMN
DROPING A COLUMN
CHANGING NAME OF COLUMN
CHANGING DATA TYPE OF A COLUMN
CHANGING NAME OF A TABLE
*/

