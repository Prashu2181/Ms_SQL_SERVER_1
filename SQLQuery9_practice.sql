use HRDATA

select * from employees

select Department_id,
     sum(salary) as empsalary, count(*) as empcount

	 from employees
	 where department_id = 10
	 group by department_id


select department_id,
max(salary) as max_salary
from employees
where department_id in (11, 10)
group by department_id

select * 
from employees
where salary =(select min(salary) from employees); 


select * 
from employees
where hire_date =(select max(hire_date) from employees)


--HR wants to know how many employees are currently in the company → COUNT.

select count(*) as Total_employees
from employees

--Finance team wants to calculate total salary budget for this month → SUM.

select sum(salary) as total_salary
from employees

--CEO asks average employee salary to compare with competitor companies → AVG.

select avg(salary) as Average_sal
from employees

--HR manager wants to find the top paid employee for yearly award → MAX.

select top 1 employee_id, max(salary) as highest_salary
from employees
group by employee_id 
order by highest_salary desc

select * from employees

--HR intern list lo, the lowest stipend amount needs to be identified → MIN.

select min(salary) as minimum_intern_salary
from employees

--Department head asks how many employees are working in each department→ COUNT + GROUP BY.

select department_id, count(*) as emp_count
from employees
group by department_id

--Finance team wants average salary for each department to plan appraisals → AVG + GROUP BY.

select department_id, avg(salary) as avg_salary
from employees
group by department_id

--Management wants only those departments where average salary > 40k → HAVING.

select department_id, avg(salary) as avg_salary
from employees
group by department_id
having avg(salary) > 40000

--HR asks which department has the most employees → COUNT + MAX.

select top 1 department_id, count(*) as Total_emps
from employees
group by department_id
order by total_emps desc

--Payroll team wants to check total salary paid to employees who joined after COVID → SUM + WHERE.

select sum(salary) as Paid_salary
from employees
where hire_date > '2020-06-12'



--HR dashboard → Show today’s system date/time → GETDATE().

select GETDATE()

--Reports → Extract year/month/day from Hire_Date → YEAR(), MONTH(), DAY().

select concat(first_name,' ',last_name) as empname,
   year(hire_date) as hireyear,
   month(hire_date) as hiremonth,
   day(hire_date) as hireday
from employees

--Recruitment team → Show employees joined after 1st Jan 2022.

select * from employees
where  hire_date > '2022-01-01'

--Finance team → Year-wise headcount growth (ex: joined in 2023).

select year(hire_date) as hire_year, count(*) as Emp_count
from employees
group by year(hire_date)
order by hire_year

--Manager → Show all employees who joined in June (campus batch tracking).

select * from employees
where (hire_date) = 6

--Appraisal system → Calculate years of service for each employee → DATEDIFF(YEAR, Hire_Date, GETDATE()).

select *, datediff(year, hire_date, getdate()) as emp_exp
from employees


--Promotion eligibility → Employees with >5 years experience.

select *, datediff(year, hire_date, getdate()) as emp_experience
from employees
where datediff (year, hire_date, getdate()) > 5

--Birthday mailer → Employees whose DOB = today’s date.

select * from employees
where month(dob) = month(getdate())
and day(dob) = day(getdate())

--HR audit → Employees joined in the last 30 days.

select * from employees
where hire_date >= dateadd(day, -30, getdate())

--Probation period tracking → Add 6 months to hire_date → DATEADD(MONTH, 6, Hire_Date).

select CONCAT(first_name,' ',last_name) as Empname,
hire_date, dateadd(MONTH, 6, hire_date) as Probation_period
from employees