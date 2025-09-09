create database Kotha_Database

use Kotha_Database

--1.Create a table Employees with columns: EmpID, EmpName, Salary, DeptID.
create table Employees
(
EmpId int,
Empname varchar(30),
salary int,
dept_id int
)

--2.Add a new column Email to Employees.

alter table employees
add Email varchar(30)

--3.Rename column Salary to EmpSalary.

exec sp_rename 'employees.salary', 'EmpSalary', 'column';


select * from employees


--4.Delete the Email column from Employees.

alter table employees
drop column Email

--5.Drop the Employees table.

drop table employees

--6.Create a table Departments with DeptID and DeptName.

create table Departments
(
deptID int,
deptname varchar(20)
)

--Company decides to add a new column PhoneNumber for all employees → ALTER TABLE.

alter table employees
add phonenumber bigint

--Old unused table Temp_2020Data needs to be removed → DROP TABLE.

drop table Temp_2020Data

--Changing column datatype from INT to BIGINT because employee IDs crossed 2 billion → ALTER.

alter table employees
alter column empid bigint



--DML (Data Manipulation Language)

--1.Insert 3 employees into Employees table.

insert into employees values(
(1,'A',23,'A@gmail.com',00000),
(2,'B',22,'B@gmail.com',11111),
(3,'C',21,'C@gmail.com',22222)
)

--2.Update salary of employee with EmpID = 102 to 50000.

update employees set salary = 50000 
where empid = 102

--3.Delete employees who don’t belong to any department.

 delete from employees
 where dept_id is null

--4.Increase all employees’ salary by 10%.

update employees
set salary = salary * 1.10;

--5.Insert multiple rows in one query into Departments.

insert into departments values
(
(101,'Admin'),
(102,'Sales'),
(103,'HR')


--New interns join company → insert their records into Employees.

insert into employees values
(
(1,'A',21,'a@gmail.com',9087689),
(2,'B',22,'b@gmail.com',8907899)
)

--Annual appraisal → increase salary of all employees by 5–10%.

update employees
set salary = salary * 1.07;

--If employee resigns → remove their record from system.

delete from employees
where emp_id = 109


--DQL (Data Query Language)---------------------------

--1.Show all employees from the Employees table.
select * from employees

--2.Select employees whose salary is greater than 40000.

select * from employees 
where salary > 40000

--3.Display only names of employees (without other columns).

select EmpName
from employees

--4.Show employees working in IT department.

select Empname, Empsalary
from employees
where dept_id = 3

--5.Retrieve all distinct department names.

select distinct deptname
from department;

--6.Sort employees by salary in descending order.

select * from employees 

order by salary desc

--HR wants a list of employees in Finance department.
select * from employees
where dept_id =3

--Manager asks for highest paid employee in the company.

select top 1 * from employees

order by salary desc

--Manager asks for highest paid employee in the company.

select distinct jobtitle
from employees




select GETDATE() as time ---2025-09-04 14:39:15.510

select GETUTCDATE() --2025-09-04 09:09:29.240

select SYSDATETIME() --2025-09-04 09:09:29.240

select SYSDATETIMEOFFSET () --2025-09-04 09:09:29.240


--wq to get previous day date?

select getdate() -1 as previous_date

--wq to get previous month date

select dateadd(MONTH, -1, getdate())

select dateadd(year, -1, getdate())

select dateadd(day, -1, getdate())

--wq to get which employees joined in the past one week

select *, dateadd(week, -1, getdate())
from employees
where hire_date >= dateadd(week, -1, getdate())


--wq to calculate your age in years, months, days

select datediff(year, '2001-08-21', getdate()) as years

select datediff(month, '2001-08-21', getdate()) as months

select datediff(DAY, '2001-08-21', getdate()) as days
 


select datename(month, getdate()) as month

