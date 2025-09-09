create database chintubank

use chintubank


create table account_details
(account_id int primary key,
Name char(30) not null,
age tinyint check (age >18),
account_type varchar(20),
current_balance int
);

select * from account_details


insert into account_details values(1, 'ram', 21, 'savings', 4000);

select getdate();

select sysdatetime();



create table transaction_details
(
transaction_id int primary key identity(101,1),
account_id int,
transaction_type varchar(10) check(transaction_type='credit' or transaction_type='debit'),
transaction_amount int,
transaction_time datetime default getdate(),
foreign key (account_id) references account_details (account_id)

);

select * from transaction_details

insert into transaction_details (account_id, transaction_type, transaction_amount) values
(1, 'credit', 2000)