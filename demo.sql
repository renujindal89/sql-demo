Database
A database is a container for all your data: it holds tables, views, stored procedures, triggers, functions, indexes, etc.
Think of it like a folder on your computer that stores files.

CREATE DATABASE mydb;


Schema

A schema is the structure or blueprint of the database: it defines how data is organized—tables, columns,
 data types, constraints, relationships.
 In MySQL, a database and a schema are essentially the same thing in terms of commands.

For example, CREATE SCHEMA mydb; works exactly like CREATE DATABASE mydb;
“In MySQL, the terms database and schema are synonyms.”

In MySQL, the semicolon ; is a query terminator.

It tells MySQL:

“This is the end of the current statement; now you can execute it.”
-- if you type only one query at a time, you can sometimes omit the semicolon, 

-- IMPORTANT 

SQL is case-insensitive for keywords.,table,columns,and values (select ,insert,update,delete,join,groupby,where,having)

Keywords → UPPERCASE
✔ Tables/columns → lowercase


create database demo
use demo;
-- drop database demo


CREATE TABLE employees (
    emp_id INT ,
    emp_name VARCHAR(50) ,
    emp_salary DECIMAL(10,2)
    
);

SHOW CREATE TABLE employees;

insert into employees values (1,'renu',1000);

INSERT INTO employees (emp_name,emp_salary,emp_id)
VALUES ('John Doe', 75000.00,2);

-- 5. Read data
SELECT * FROM employees;

-- 6. Update data

SET SQL_SAFE_UPDATES = 0;  -- Disable Safe Mode Temporarily

UPDATE employees
SET emp_salary = 80000.00
WHERE emp_id = 1;

-- 7. Delete data
DELETE FROM employees
WHERE emp_id = 1;

-- 8select * from employees 

