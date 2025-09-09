create database Shopping

use shopping


CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at DATE DEFAULT sysdatetime()
);

select * from Users

INSERT INTO Users (user_id, username, password, email, first_name, last_name, created_at) VALUES
(1, 'johndoe','password123','john.doe@example.com','John','Doe', Cast('2025-01-01 10:00:00' as datetime)),
(2,'janedoe','password456','jane.doe@example.com','Jane','Doe', cast('2025-01-02 11:00:00' as datetime)),
(3,'mike123','pass987','mike@example.com','Mike','Johnson', cast('2025-01-03 12:00:00' as datetime)),
(4,'sarah_23','hello123','sarah23@example.com','Sarah','Connor', cast('2025-01-04 14:00:00' as datetime)),
(5,'daveking', 'kingdave5', 'daveking@example.com', 'Dave', 'King', cast('2025-01-05 09:00:00' as datetime)),
(6,'emily_77', 'emily789', 'emily@example.com', 'Emily', 'Clark', cast('2025-01-06 08:30:00' as datetime)),
(7,'robert12', 'secure123', 'robert12@example.com', 'Robert', 'lee', cast('2025-01-07 10:00:00' as datetime))

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    price decimal(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    created_at DATE DEFAULT SYSDATETIME()
);


select * from products

INSERT INTO Products (product_id, product_name, description, price, stock_quantity, created_at)
VALUES
(1,'Laptop','High-end gaming laptop', 1200.00, 10, Cast('2025-01-01 10:00:00' as datetime)),
(2,'Smartphone','Latest 5g Smartphone', 800.00, 15, Cast('2025-01-01 11:00:00' as datetime)),
(3,'Wireless Mouse','Ergonomic wireless Mouse', 50.00, 10, Cast('2025-01-02 12:00:00' as datetime)),
(4,'HeadPhones','Noise-cancelling headphones', 150.00, 30, Cast('2025-01-03 10:30:00' as datetime)),
(5,'Tablet','10-inch Android tablet', 300.00, 20, Cast('2025-01-04 11:00:00' as datetime)),
(6,'Smart Watch','fitness tracking smartwatch', 200.00, 40, Cast('2025-01-05 14:00:00' as datetime)),
(7,'Bluetooth Speaker','Null', 70.00, 50, Cast('2025-01-06 09:00:00' as datetime))


CREATE TABLE ShoppingCart (
    cart_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    added_at DATE DEFAULT SYSDATETIME(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

select * from ShoppingCart

INSERT INTO ShoppingCart (cart_id, user_id, product_id, quantity, added_at) VALUES
(1, 1, 1, 5, cast('2025-01-15 14:00:00' as datetime)),
(2, 1, 2, 1, cast('2025-01-15 14:05:00' as datetime)),
(3, 2, 3, 3, cast('2025-01-16 15:00:00' as datetime)),
(4, 3, 4, 2, cast('2025-01-17 10:30:00' as datetime)),
(5, 4, 5, 1, cast('2025-01-18 11:15:00' as datetime)),
(6, 5, 6, 1, cast('2025-01-19 12:00:00' as datetime)),
(7, 6, 7, 0, cast('2025-01-20 14:30:00' as datetime));


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE DEFAULT SYSDATETIME(),
    total_amount decimal(10, 2),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

select * from orders

INSERT INTO Orders (order_id, user_id, order_date, total_amount, status) VALUES
(1, 1, Cast('2025-01-16 16:00:00' as datetime), 2400.00, 'Pending'),
(2, 2, Cast('2025-01-17 10:00:00' as datetime), 150.00, 'Pending'),
(3, 3, Cast('2025-01-18 12:30:00' as datetime), 300.00, 'Pending'),
(4, 4, Cast('2025-01-19 14:00:00' as datetime), 450.00, 'Pending'),
(5, 5, Cast('2025-01-20 09:00:00' as datetime), 200.00, 'Pending'),
(6, 6, Cast('2025-01-21 15:00:00' as datetime), 140.00,'Pending'),
(7, 7, Cast('2025-01-22 17:00:00' as datetime), 140.00, 'Pending');

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price decimal(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

select * from OrderDetails

INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 5, 1200.00),
(2, 1, 2, 1, 800.00),
(3, 2, 3, 3, 50.00),
(4, 3, 4, 2, 150.00),
(5, 4, 5, 1, 300.00),
(6, 5, 6, 1, 200.00),
(7, 6, 7, 0, 70.00);


--1. If the product description is NULL, replace it with 'No description available':

select product_id, product_name,
coalesce(description, 'No Description Available') as product_description
from products;

--2.Find users who have more than 5 items in their cart:

select user_id, username
from Users
where user_id in (
    select user_id
    from ShoppingCart
    group by user_id
    having sum(quantity) > 5
)
--3.Find the year and month when products were created:

select 

     year(created_at) as year_created,
	 month(created_at) as month_created

from products


--4.Find users who have more than 3 items in their cart:

select user_id, username
from Users
where user_id in (
    select user_id
    from ShoppingCart
    group by user_id
    having sum(quantity) > 3
)

--5.Find the number of products in each category:

select product_id, sum(stock_quantity) as total_products
from products
group by product_id;

--6.Find the maximum and minimum prices of products in each category:

select 
    max(price) as max_price,
    min(price) as min_price
from products;

select* from products

--7.Find categories with more than 5 products:

select product_name, stock_quantity
from products
where stock_quantity > 5;

--8.Get the total price for each category and order the results by the total price:

select sum(price * stock_quantity) as total_value
from products;

select product_name, sum(price) as total_price
from products
group by product_name
order by total_price desc;

--9.Find the total price of products sold per year (assuming there's a sale_date column) and orders them chronologically.

select year(created_at) as sale_year,
       sum(price * stock_quantity) as total_sales
from products
group by year(created_at)
order by sale_year asc;

select year(sale_date) as sale_year,
       sum(price * stock_quantity) as total_sales
from products
group by year(sale_date)
order by sale_year asc;

--10. Retrieve all users and their corresponding orders (if any).----------------------------
--11. Retrieve all orders and their corresponding users (if any).----------------------------

--12.Find pairs of products where the price of one product is greater than the other.-------------------------------

--13.Retrieve all user and users, including all unmathced records from both tables.-----------------------


--14. Write a query to find employees who joined in the year 2022.
select *
from employees
where year(hire_date) = 2022;

--15. Write a query to find employees who joined in the month of March.
select *
from employees
where hire_date between '2022-03-01' and '2022-03-31';

--16. Write a query to replace NULL values in the column Address with “Not Available”.
select employee_id, 
       empname, 
       isnull(address, 'Not Available') as address
from employees;

--17. Write a query to get the first 3 characters of employee names.

select employee_id,
       empname,
       left(empname, 3) as first_three_chars
from employees;

--18. Write a query to concatenate FirstName and LastName with a space in between.

select concat (fisrt_name,' ',last_name)
from employees

--19. Write a query to list employees whose salary is greater than the average salary.

select employee_id, empname, salary
from employees
where salary > (select avg(salary) from employees);

--20. Write a query to display the top 3 highest salaries.

select top 3 employee_id, empname, salary
from employees
order by salary desc;

--21. Write a query to find the second highest salary from the Employees table.

select max(salary) as second_highest_salary
from employees
where salary < (select max(salary) from employees);

--22.Write a query to calculate total sales amount (Quantity * Price) from the Sales table.

select sum(Quantity * Price) as Total_Sales_Amount
from Sales;

--23. Write a query to find the average quantity sold per product.

select product_id, avg(quantity) as Avg_Quantity_Sold
from Sales
group by product_id;

--24.Write a query to display the top 3 products with the highest sales amount.

select top 3 product_id, 
sum(quantity * price) as Total_Sales
from Sales
group by product_id
order by Total_Sales desc;

--25.Write a query to list all sales made in March 2023.

select * from Sales
where year(sale_date) = 2023  and month(sale_date) = 3;

--26.Write a query to group sales by month and calculate the total sales per month.

select 
year(sale_date) as Sale_Year,
month(sale_date) as Sale_Month,
sum(quantity * price) as Total_Sales
from Sales
group by year(sale_date), month(sale_date)
order by Sale_Year, Sale_Month;

--27. Write a query to display employees whose name starts with ‘A’.

select *
from Employees
where EmpName like 'A%';

--28. Write a query to display employees whose name ends with ‘n’.

select *
from Employees
where EmpName like '%n';

--29. Write a query to display employees whose name contains ‘ra’.

select *
from Employees
where EmpName like '%ra%';

--30. Write a query to order employees by salary in descending order.

select *
from Employees
order by Salary desc;

--31. Write a query to display the 5 most recently joined employees.

select top 5 *
from Employees
order by Hire_Date desc;

--32.Write a query to calculate the number of days each employee has worked since joining.
select EmpID, EmpName, Hire_Date,
datediff(day, Hire_Date, getdate()) as Days_Worked
from Employees;

--33.Write a query to get the current system user.--------------------------------------------

--34.Write a query to display the difference in years between today’s date and employee’sJoiningDate.

select EmpID, EmpName, Hire_Date,
datediff(year, Hire_Date, getdate()) as Years_Worked
from Employees;

--35. Write a query to find employees who joined between ‘2022-01-01’ and ‘2022-12-31’.

select *
from Employees
where Hire_Date between '2022-01-01' and '2022-12-31';

--36. Write a query to display duplicate employee names if any.

select EmpName, count(*) as NameCount
from Employees
group by EmpName
having count(*) > 1;


--37. Write a query to display the count of employees for each JoiningDate.

select Hire_Date, count(*) as EmpCount
from Employees
group by Hire_Date
order by Hire_Date;

--38. Write a query to calculate the percentage of employees in each department.-------------------

--39. Write a query to round the salary of employees to 2 decimal places.----------------------

--40. Write a query to display employees ordered by JoiningDate ascending.
SELECT *
FROM Employees
ORDER BY JoiningDate ASC;












