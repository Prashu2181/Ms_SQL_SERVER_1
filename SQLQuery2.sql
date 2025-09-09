
create database Practice

use practice

create table test 
(
 ID int IDENTITY(1,1),
 name varchar(50),
 salary int

)

insert into test values('Ram', 4500),
('Sita', 3500),
('Prshu', 4500);

select * from test

delete from test

-- how to rollback truncated data

begin transaction
delete from test

rollback

-- SCENARIO -- How to reset IDENTITY property before insert into table?

delete from test

dbcc checkident (test, reseed, 0)

alter table test
add phone_no bigint;


update test
set email_id = 'c@gmail.com'
where id = 3;

update test 
set phone_no = 9898934345
where id = 2;