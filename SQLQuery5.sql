create database studentDB

use studentDB

create table student_details(id int, name varchar(50), age int, gender char(6));

select * from student_details

insert into student_details values(1, 'Ram', 23, 'Male'),
(2, 'Sita', 23, 'Female'),
(3, 'Prashu', 23, 'Male');

Alter table student_details ADD Phone_no bigint

update student_details set Phone_no = 6300897675
where id = 5


insert into student_details (id, name, age, gender)
values(4, 'srushi', 23, 'Female'),
(5, 'sanju', 21, 'Female');


insert into student_details (id, name, gender, phone_no)
values(6, 'chintu', 'male', 7896584568)

insert into student_details (id, gender)
values (7, 'male');

insert into student_details(id, name, phone_no)
values (8, 'babji', 9087678980);


select * from student_details

update  student_details set age =21
where id = 6

update student_details set name = 'pitre'
where id = 7

delete from student_details

where id in (4, 5, 6, 7, 8)

update student_details set gender = 'male'
where id = 8

update student_details set age =22
where name = 'babji'


insert into student_details (id, name, age, gender, Phone_no)
values(10, 'bhogi', 23, 'male', 9876545888)


alter table student_details
add emailID varchar(50), fees int, grade char, attendace int


select * from student_details


delete from student_details
where emailID = 'ram@gmail.com'


alter table student_details
drop column attendace


update student_details

set emailID = case id
when 1 then 'ram@gmail.com'
when 2 then 'sita@gmail.com'
when 3 then 'prashu@gmail.com'
when 4 then 'srushi@gmail.com'
when 5 then 'sanju@gmail.com'
when 6 then 'chintu@gmail.com'
when 7 then 'pitre@gmail.com'
when 8 then 'babji@gmail.com'
when 9 then 'seshu@gmail.com'
when 10 then 'bhogeswar@gmail.com'
end;

update student_details

set fees = case id 

when 1 then 20000
when 2 then 30000
when 3 then 25000
when 4 then 19000
when 5 then 17000
when 6 then 13000
when 7 then 20000
when 8 then 10000
when 9 then 12000
when 10 then 20000
end;


update student_details

set grade = case id 


when 1 then 'A'
when 2 then 'C'
when 3 then 'B'
when 4 then 'A'
when 5 then 'C'
when 6 then 'B'
when 7 then 'A'
when 8 then 'A'
when 9 then 'B'
when 10 then 'D'
end;


select * from student_details

begin transaction
delete student_details


rollback



alter table student_details
add location varchar(20)

update student_details set location = 'hyderabad'
where id in (1, 3, 5, 10)

update student_details set location = 'chennai'
where id in (2,4)

update student_details set location = 'banglore'
where id in (6,9)

update student_details set location = 'Andhra pradesh'
where id in (7,8)


select count (*) from student_details 

select count(*) as no_of_students from student_details

select count(*) as no_of_students from student_details
where location = 'hyderabad';

select * from student_details

select count(*) as no_of_students from student_details
where location = 'chennai';



-- SBI BRANCHES EXAMPLE--------------------------------------
select location, count(*) as no_of_students from student_details
group by location;

select location, count(*) as no_of_students from student_details
group by location
having  count(*) > 3;


select * from student_details order by name desc;

select * from student_details


select top 5 * from student_details


