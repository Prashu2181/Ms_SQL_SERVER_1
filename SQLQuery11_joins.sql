use HRDATA

select * from employees

select * from departments


select E.employee_id, E.first_name, E.hire_date, E.salary, E.department_id,
 D.department_name

from employees As E

inner join

departments as D

on E.department_id = D.department_id


--write a query to get all the employee details with their department name?

select E.*,
D.department_name

from employees as E

inner join

departments as D

on E.department_id = D.department_id

-- write a query to get each department name with their employee count?

select count(*) as Empcount,
D.department_name

from employees as E

inner join

departments as D

on E.department_id = D.department_id

group by D.department_name

--write a query to get only IT sales employee count and which department having more than 5 employees?

select count(*) as Empcount,
D.department_name

from employees as E

inner join

departments as D

on E.department_id = D.department_id

where D.department_id in (6, 8)

group by D.department_name

 

--write a query to get highest salary for each department?

select max(salary) as highest_salary,
D.department_name

from employees as E

inner join

departments as D

on E.department_id = D.department_id

group by D.department_name

--write a query to get employee count by employee joining year?

select E.hire_Date,
   count(E.employee_id) as Empcount
from employees as E
inner join 
departments as D
on E.Department_id = D.department_id
group by E.hire_date
order by E.hire_date

--write a query to get year, month by total salary
select 
    year(E.hire_date) as join_year,
	month(E.hire_date) as join_month,
    sum(salary) as total_sal
from employees as E
inner join  
departments as D
on E.Department_id = D.department_id
group by year(E.hire_date), month(E.hire_date)
order by Join_Year, Join_Month;

--write a query to get which employee is not belong to any department?

select E.*
from employees as E

left join
departments as D
on e.department_id = d.department_id
where d.department_id is null

--write a query to get which department don't have any emloyees
select D.*
from departments as D
left join
employees as E
on d.department_id = e.department_id
where d.department_id is null


--write a query to get region name, country name, state name, city name, department name, EmpId, Ename, Salary, hiredate and with 
--employee having more than 30 years of experience

select r.region_name, c.country_name, L.state_province, L.city, D.department_name, 
E.employee_id, CONCAT(E.first_name,' ',last_name) as Ename, E.salary, e.hire_date

from Regions as R

join countries as C
on r.region_id = c.region_id

join locations as L

on c.country_id = L.country_id

join departments as D

on l.location_id = d.location_id

join employees as E

on D.department_id = E.department_id

where DATEDIFF(year, hire_date, getdate()) >30


--write a query to get all region names and those employee count

select 
 r.region_name, count(E.employee_id) as emp_count
from Regions as R
left join countries as c
on r.region_id = c.region_id
left join locations as L
on c.country_id = l.country_id
left join departments as D
on l.location_id = d.location_id
left join employees as E
on D.department_id = E.department_id
group by r.region_name























