create database constraints

use constraints

create table Departments
(
deptID int Primary key,
deptname varchar(50) not null,
)

insert into Departments values (10, 'Admin')

create table Employee
(
EmpId int Primary key,
Empname varchar(50) not null,
gender char(1) null,
EmailID varchar(60) unique,
ph_num bigint unique not null,
date_of_join date default('9999-01-01'),
salary int check(salary > 0),
deptid int foreign key references departments (deptid)
)

select * from Departments

select * from Employee

insert into employee values(101, 'Prashu', 'M', 'prashu@gmail.com', 9988776655, '2025-08-09', 90000, 10);
insert into employee values(102, 'Srushi', 'f', 'srushi@gmail.com', 9988776659, '2025-08-07', 90000, 10);
                            