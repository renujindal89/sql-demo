create database complere;
use complere;
create table student(stuname char(5));
insert into student values('amit');
insert into student values('amit',f,f,f,f,d),('aman');
select * from student;
insert into student values('aditya');
create table employee (empname varchar(20));
insert into employee values ('fgkjhfkejgfhehkjfghgfjkhfwfgewhfehwjf');
select * from employee;
drop table student;
drop table employee;
create table student 
(stuname varchar(50),stuid int,stuage int);
desc student;
alter table student
add column course char(10);
alter table student 
add column fee int;
alter table student
drop column course;
alter table student
rename column fee to course_fee;
alter table student 
modify column stuname char(10);
create table course (corname varchar(10));
insert into course values('data'),('ca');
select * from course;
select * from student;
insert into student values ('aman',2,13),
('amit',3,14),('aditya',4,10);
drop table course;
desc course;
truncate table student;
desc student;
select * from student;
alter table student 
add constraint pk1
primary key (stuid);
drop table student;
desc student;
insert into student values('manya',6,12,);
--not null
alter table student
add column year int not null ; 
alter table student 
add column fees int  default '200';
insert into student values('manya',7,20,2,2007);




