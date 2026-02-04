

A UNIQUE constraint ensures that all values in a column (or a set of columns) are distinct.
A table can have both a primary key and one or more unique keys



create database class3;
use class3;
drop database class3;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(100)
);


desc students;

INSERT INTO Students (student_id, email, name)
VALUES
    (1, 'alice@example.com', 'Alice'),
    (2, 'bob@example.com', 'Bob'),
    (3, 'charlie@example.com', 'Charlie');
    
    INSERT INTO Students (student_id, email, name)
VALUES (4, 'alice@example.com', 'Eve');  -- error

INSERT INTO Students (student_id, email, name)
VALUES (5, NULL, 'Frank');  -- allowed

select * from students;



SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'students';


-- student_id is the primary key (must be unique and not NULL).
-- email must also be unique, but it can be NULL if not provided.


-- as of now no rules break


select * from students;

INSERT INTO Students (student_id, email, name)
VALUES (null, NULL, 'Frank');  -- pk error

INSERT INTO Students (student_id, email, name)
VALUES (5, NULL, 'Frank');  -- pk error duplicate

-- primarykey as composite key(combination of two column)

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    PRIMARY KEY (student_id, course_id),
    UNIQUE (student_id, semester)
);

INSERT INTO Enrollments (student_id, course_id, semester)
VALUES
    (1, 101, 'Fall2025'),   -- Student 1 in Course 101, Fall2025
    (2, 102, 'Fall2025'),   -- Student 2 in Course 102, Fall2025
    (3, 103, 'Spring2026'); -- Student 3 in Course 103, Spring2026
    
    -- Violates PRIMARY KEY
    INSERT INTO Enrollments (student_id, course_id, semester)
VALUES (1, 101, 'Fall2025');  -- error
INSERT INTO Enrollments (student_id, course_id, semester)
VALUES (1, 102, 'Fall2025'); -- error

INSERT INTO Enrollments (student_id, course_id, semester)
VALUES (1, 104, 'Spring2026'); -- error unique key







-- NOT NULL 

CREATE TABLE Students1 (
    student_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Students1 (student_id, email, name)
VALUES
    (1, 'alice@example.com', 'Alice'),
    (2, 'bob@example.com', 'Bob');
    
    INSERT INTO Students1 (student_id, email, name)
VALUES (3, NULL, 'Charlie');-- error

INSERT INTO Students1 (student_id, email, name)
VALUES (4, 'david@example.com', NULL); -- error

-- NOTE 
-- Primary key columns are automatically NOT NULL.
-- You can combine NOT NULL with other constraints (UNIQUE, CHECK, DEFAULT).

-- CHECK  

-- The CHECK constraint in SQL is used to enforce a condition on values in a column. 
-- It ensures that only data meeting the specified rule can be inserted into the table.
-- If the condition evaluates to FALSE, the database rejects the insert or update.
CREATE TABLE Students2 (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18)
);



INSERT INTO Students2 (student_id, name, age)
VALUES (1, 'Alice', 20); -- valid

INSERT INTO Students2 (student_id, name, age)
VALUES (2, 'Bob', 16);-- invalid


CREATE TABLE Courses ( 
course_id INT PRIMARY KEY,
 course_name VARCHAR(100), 
credits INT CHECK (credits BETWEEN 1 AND 5));-- 1,2,3,4,5 -- credits >= 1 AND credits <= 5 );


INSERT INTO Courses (course_id, course_name, credits) VALUES
(1, 'Introduction to Programming', 3),
(2, 'Database Systems', 4),
(3, 'Calculus I', 5),
(4, 'English Literature', 2),
(5, 'Physics', 4),
(6, 'Art History', 1);

INSERT INTO Courses (course_id, course_name, credits) VALUES
(7, 'Introduction to Programming', 3),
(8, 'Database Systems', 4.5);


-- The DEFAULT

 -- constraint in SQL is used to automatically assign a value to a column if no value is provided
--  during an INSERT
-- If you don’t insert a value into a column with a DEFAULT, the database fills it in automatically.
-- You can still override the default by explicitly providing a value.

CREATE TABLE Students3(
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(20)  DEFAULT 'Active'
);

INSERT INTO Students3 (student_id, name)
VALUES (3, 'Alice');
select * from students3;
INSERT INTO Students3 (student_id, name, status)
VALUES (2, 'Bob', 'Inactive'); -- override


select * from students3;

-- add--> pk,fk,check,unique

ALTER TABLE table_name
ADD CONSTRAINT pk_name PRIMARY KEY (column_name);


ALTER TABLE table_name
ADD CONSTRAINT check_name CHECK (condition);

Add a DEFAULT constraint
Technically defaults are not “constraints” but column attributes:

ALTER TABLE table_name
ALTER COLUMN column_name SET DEFAULT value;


ALTER TABLE orders
ALTER COLUMN status SET DEFAULT 'pending';

Add a NOT NULL constraint
ALTER TABLE table_name
MODIFY column_name datatype NOT NULL;

ALTER TABLE table_name
MODIFY id INT;  -- remove AUTO_INCREMENT


-- DROP 

ALTER TABLE table_name
DROP FOREIGN KEY fk_name;

ALTER TABLE table_name
DROP PRIMARY KEY;

ALTER TABLE table_name
DROP FOREIGN KEY fk_name;

ALTER TABLE table_name
ALTER COLUMN column_name DROP DEFAULT;



ALTER TABLE child_students_enroll1
DROP CONSTRAINT students_enroll1_ibfk_1;


ALTER TABLE child_students_enroll1
ADD CONSTRAINT students_enroll1_ibfk_1
FOREIGN KEY (corsename)
