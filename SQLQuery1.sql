use aadhar



update PersonalDetails
set phone_no = 9133799517, email_id = 'prasanna@gmail.com', address = 'machilipatnam'
where Username = 'Prasanna';

update PersonalDetails
set phone_no = 9133879666, email_id = 'chintu998@gmail.com', address = 'hyderabad'
where Username = 'srushi';

update PersonalDetails
set phone_no = 8688879666, email_id = 'sanjuuu@gmail.com', address = 'baroda'
where Username = 'sanju';

ALTER TABLE PersonalDetails
ADD aadhar_no VARCHAR(20);

update PersonalDetails
set aadhar_no = 458820503800
where Username = 'prasanna';

update PersonalDetails
set aadhar_no = 1234567890
where Username = 'srushi';

update PersonalDetails
set aadhar_no = 0987654321
where Username = 'sanju';


select * from PersonalDetails

insert into PersonalDetails (Username, Age, Gender, phone_no, email_id, address, aadhar_no)values

('chintu', 23, 'male', 9876789056, 'bhjjuu@gmail.com', 'hyderabab', 456789987654),
('babji', 24, 'male', 8798765778, 'babji786@gmail.com', 'chennai', 987675443446),
('swathi', 23, 'female', 786677883, 'swaa78998@gmail.com', 'kerala', 456789876555);


alter table personaldetails
add father_name varchar(50);

alter table personaldetails
add mother_name varchar(50);

select * from PersonalDetails

update PersonalDetails
set father_name = 'tonivo thomas'
where Username = 'swathi';

update PersonalDetails
set mother_name = 'andrea'
where Username = 'swathi';

