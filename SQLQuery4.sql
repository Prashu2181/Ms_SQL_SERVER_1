create database schoolDB

use schoolDB

create table courses
(
courseid int primary key,
coursename varchar(50) unique not null
)

insert into courses values(101, 'English'),
(102, 'maths'),
(103, 'science'),
(104, 'social'),
(105, 'EVS')



create table students
(
stu_id int primary key,
stud_name varchar(50) not null,
gender char(1) null,
emailID varchar(50) unique,
ph_no bigint unique not null,
age int check(age > 5 AND age < 20),
Admission_date date default ('9999-01-01')
)

insert into students values
(1, 'ram', 'm', 'ram@gmail.com', 9988997766, 13, '2017-06-13'),
(2, 'sita', 'f', 'sita@gmail.com', 9988997788, 15, '2017-06-12'),
(3, 'laxman', 'm', 'lucky@gmail.com', 9988997777, 12, '2017-06-13'),
(4, 'anjii', 'm', 'hanu@gmail.com', 9988997755, 15, '2017-06-11'),
(5, 'bahrat', 'm', 'india@gmail.com', 9988997733, 11, '2017-06-17')

create table Enroll
(
enrollmentid int primary key,
StudentID INT,
CourseID int,
Grade CHAR(1) CHECK (Grade IN ('A','B','C','D','F')),
stu_id int foreign key references students(stu_id),
foreign key (courseid) references courses(courseid)
);

insert into enroll values 
(1, 1, )


select * from courses

select * from students

select * from Enroll

