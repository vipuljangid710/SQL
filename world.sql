show databases;
use world;
select distinct(continent) from country;

select count(name), count(distinct(name)) from country;

select count(population), sum(population), avg(population) from country;

select count(surfacearea),sum(surfacearea),max(surfacearea) from country;

select count(continent),max(continent),min(continent) from country;



select population,count(population) from country;


select name, continent, region, population from country
order by population,name;

select name, continent, region, population from country
order by continent,name;

select name, continent, region, population from country



select c.id,c.name,c.countrycode,cty.name from city as c natural join country as city;

create database selfjoin;

create table employees(eid int , name varchar(20), manager_id int );

insert into employees values(1,'vipul',null),(2,'abhinav',1),(3,'saksham',1),(4,'akshay',2);

select emp.eid,emp.name,emp.manager_id,mngr.eid,mngr.name from employees as emp
join employees as mngr
where emp.manager_id=mngr.eid;

select * from employees;
use selfjoin;

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');


CREATE TABLE employes (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);

INSERT INTO employes VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');

CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);

INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);

select * from employes;

-- question 1
select e.emp_id, e.emp_name ,d.dept_name, d.location from employes as e
join departments as d
on e.dept_id = d.dept_id;

-- question 2
select p.proj_id, p.proj_name, d.dept_name, p.budget from projects as p
join departments as d
on p.dept_id = d.dept_id;

-- question 4
select e.emp_id, e.emp_name, d.dept_id, d.dept_name from employes as e
left join departments as d
on e.dept_id = d.dept_id;

-- question 3 
SELECT e.emp_name, d.dept_name, p.proj_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;

-- question 5
select d.dept_id, d.dept_name, p.proj_name, p.budget from departments as d
left join projects as p
on d.dept_id = p.dept_id;

-- question 6
select e.emp_id, e.emp_name, d.dept_id from employes as e
left join departments as d
on e.dept_id = d.dept_id;

-- question 7 
SELECT e.emp_name, d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- question 8 
SELECT d.dept_name, p.proj_id, p.proj_name, p.dept_id
FROM departments d
RIGHT JOIN projects p
ON d.dept_id = p.dept_id;

-- question 9
select d.dept_id, d.dept_name , d.location from employes as e
right join departments as d
on d.dept_id =e.dept_id and e.emp_id is null;

-- question 10
select * from employes as e 
cross join departments as d
where (dept_name = 'Legal' or dept_name = 'Finance') and salary>70000;


-- question 11
SELECT p.proj_name, p.budget, d.dept_name, d.location
FROM projects p
CROSS JOIN departments d
WHERE p.budget >= 400000
AND d.location IN ('Mumbai', 'Pune');


-- question 12
SELECT COUNT(*) AS total_combinations
FROM employees
CROSS JOIN departments;

-- question 13
SELECT emp_id, emp_name, dept_id, salary, city
FROM employees
WHERE salary > 60000;

-- question 14
SELECT emp_id, emp_name, salary, city
FROM employees
WHERE city IN ('Delhi', 'Mumbai');

-- question 15
SELECT emp_id, emp_name, dept_id, salary
FROM employees
WHERE dept_id IS NULL;

-- question 16
SELECT dept_id, dept_name, location
FROM departments
WHERE location IN ('Bangalore', 'Delhi');

-- question 17
SELECT dept_id, dept_name, location
FROM departments
WHERE dept_id >= 30;

-- question 18
SELECT dept_id, dept_name, location
FROM departments
WHERE dept_name LIKE 'F%'
   OR dept_name LIKE 'L%';

-- question 19
SELECT proj_id, proj_name, dept_id, budget
FROM projects
WHERE budget BETWEEN 200000 AND 400000;

-- question 20
SELECT proj_id, proj_name, dept_id, budget
FROM projects
WHERE dept_id = 20;

-- question 21
SELECT proj_id, proj_name, budget
FROM projects
WHERE proj_name LIKE '%a%'
  AND budget < 300000;
  
-- question 22
SELECT 
    e.emp_name, 
    d.dept_name, 
    d.location, 
    p.proj_name, 
    p.budget
FROM 
    employee e
INNER JOIN 
    department d ON e.dept_id = d.dept_id
INNER JOIN 
    project p ON e.dept_id = p.dept_id;
    
-- question 23
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    p.proj_name
FROM 
    employees e
LEFT JOIN 
    departments d ON e.dept_id = d.dept_id
LEFT JOIN 
    projects p ON e.emp_id = p.emp_id;
    
    
-- question 24
SELECT 
    e.emp_name, 
    e.salary, 
    d.dept_name, 
    p.proj_name, 
    p.budget
FROM 
    Employees e
JOIN 
    Departments d ON e.dept_id = d.dept_id
JOIN 
    Projects p ON d.dept_id = p.dept_id
WHERE 
    e.salary > 60000 
    AND p.budget > 250000;
    
-- question 25
SELECT 
    d.dept_id, 
    d.dept_name, 
    e.emp_name, 
    p.proj_name
FROM 
    Departments d
LEFT JOIN 
    Employees e ON d.dept_id = e.dept_id
LEFT JOIN 
    Projects p ON d.dept_id = p.dept_id;
    
-- question 26
SELECT 
    e.emp_name, 
    d.location, 
    p.proj_name
FROM 
    Employees e
JOIN 
    Departments d ON e.dept_id = d.dept_id
JOIN 
    Projects p ON d.dept_id = p.dept_id
WHERE 
    d.location IN ('Bangalore', 'Mumbai');
    
-- question 27
SELECT 
    A.emp_name AS employee_1,
    B.emp_name AS employee_2,
    A.city
FROM 
    employees A
INNER JOIN 
    employees B 
ON 
    A.city = B.city 
    AND A.emp_name < B.emp_name;
    
-- question 28
SELECT 
    p.proj_name,
    p.dept_id,
    e.emp_name
FROM 
    projects p
LEFT JOIN 
    employees e 
ON 
    p.dept_id = e.dept_id;
    
use selfjoin;

select d.dept_name,count(*)
from employees as e
join departments as d on e.dept_id=d.dept_id
group by d.dept_name;
 
 
 
 
 
 
 -- Sub Query
 
 create database cwr_db;
 use cwr_db;
 
 create table employee_c(id int,name varchar(30),salary int);
 insert into employee_c values(1,'a',100),(2,'b',250),(3,'c',400),(4,'d',300);
 
 select max(salary) from employee_c;
 
 select * from employee_c where salary=400;
 
 
 
 select min(salary) from employee_c;
 select * from employee_c where salary=100;
 
 select * from employee_c where salary=(select min(salary) from employee_c);
 
 
 select max(salary) from employee_c;
 select * from employee_c where salary=400;
 
 select * from employee_c where salary=(select max(salary) from employee_c);
 
 
 
 
 insert into employee_c values(5,'a',300);
 
 select * from employee_c;

select * from employee_c
where salary = any(select salary from employee_c where name='a');
 
 select * from employee_c
where salary > any(select salary from employee_c where name='a');

 
 
 select * from employee_c where salary=(select salary from employee_c where name='b');
 
 
 
 
 use world;
 
 select * from city where district = ( select name from city where Name = "Abu Dhabi");
 
 select * from city where population =(select max(population)from city);
 
 create table orders(order_id int,name varchar(30),salary int);
 insert into orders values (1,'a',100),(2,'a',200),(3,'a',300),(4,'b',400),(5,'b',300);
 
-- select * from orders;--
 
 select order_id,name,salary from 
 orders as o where salary=(select max(salary)from orders where name =o.name )
 and name = o.name;
 
 create database newdb;

use newdb;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender CHAR(1),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


INSERT INTO Department VALUES
(101, 'HR', 'Delhi'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Pune'),
(105, 'Marketing', 'Hyderabad');



INSERT INTO Employee VALUES
(1, 'Amit',    'M', 55000, 101, NULL),
(2, 'Neha',    'F', 48000, 101, 1),
(3, 'Raj',     'M', 62000, 101, 1),
(4, 'Priya',   'F', 70000, 102, NULL),
(5, 'Arjun',   'M', 68000, 102, 4),
(6, 'Kiran',   'F', 72000, 102, 4),
(7, 'Rohit',   'M', 61000, 102, 4),
(8, 'Sneha',   'F', 80000, 103, NULL),
(9, 'Vikas',   'M', 75000, 103, 8),
(10,'Anjali',  'F', 78000, 103, 8),
(11,'Mohit',   'M', 50000, 104, NULL),
(12,'Pooja',   'F', 45000, 104, 11),
(13,'Deepak',  'M', 53000, 104, 11),
(14,'Riya',    'F', 60000, 104, 11),
(15,'Kunal',   'M', 65000, 105, NULL),
(16,'Nisha',   'F', 62000, 105, 15),
(17,'Varun',   'M', 59000, 105, 15),
(18,'Isha',    'F', 67000, 105, 15),
(19,'Manish',  'M', 64000, 105, 15),
(20,'Kavya',   'F', 52000, 101, 1);


select * from employee where dept_id=104
and salary=(select max(salary) from employee where dept_id=104);




select * from employee as eout where 
salary=(select max(salary) from employee where dept_id=eout.dept_id);
 
 
 select * from employee where dept_id=104
 and salary>=all(select salary from employee where dept_id=104);
 
 select e.emp_id, e.emp_name, d.dept_name, e.salary from employee as e
 join department as d on e.dept_id=d.dept_id
 where salary>(select avg(salary) from employee where dept_id=e.dept_id);
 
 select avg(salary) from employee where dept_id=102;
 
 select * from employee as e
 where
 salary>all(select salary from employee where dept_id=e.dept_id and emp_id!=e.emp_id);
 
 select emp_name from employee as eout where
 salary!=(select max(salary) from employee where dept_id=eout.dept_id);
 
 select dept_id,dept_name from department where
 dept_id=any (select dept_id from employee
 where salary>70000);
 
 select max(salary) from employee where salary<(select max(salary) from employee);
 
 select emp_name, dept_id, salary
 from employee as e1
 where salary=(
 select max(salary) from employee as e2 where
 dept_id=e1.dept_id and
 salary< (select max(salary) from employee where dept_id=e1.dept_id));
 
 create database newdb2;
 use newdb2;
 CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);
INSERT INTO Customers VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Chicago'),
(103, 'Charlie', 'Dallas'),
(104, 'David', 'Seattle'),
(105, 'Emma', 'Boston'),
(106, 'Frank', 'Chicago'),
(107, 'Grace', 'Dallas'),
(108, 'Henry', 'Miami');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);
INSERT INTO Orders VALUES
(1001, 101, '2025-01-05', 1200, 'Delivered'),
(1002, 101, '2025-02-15', 800, 'Cancelled'),
(1003, 102, '2025-01-20', 3500, 'Delivered'),
(1004, 102, '2025-03-10', 600, 'Pending'),
(1005, 103, '2025-02-18', 900, 'Delivered'),
(1006, 104, '2025-03-05', 4500, 'Delivered'),
(1007, 104, '2025-04-01', 700, 'Pending'),
(1008, 105, '2025-01-11', 1500, 'Cancelled'),
(1009, 105, '2025-04-12', 2200, 'Delivered'),
(1010, 107, '2025-05-01', 1800, 'Pending');

-- exist is always check only one value
-- in operators check the every values written by subquery
-- it will give atleast one output
-- exist is faster than in operator
-- in operator checks all the values but exist not

select * from customers where customer_id in
(select customer_id from orders);

 select * from customers where exists
 (select 1 from orders where orders.customer_id=customers.customer_id);
 
 select * from customers where not exists
 (select 1 from orders where orders.customer_id=customers.customer_id);
 
 select * from customers where exists
 (select 1 from orders where orders.customer_id=customers.customer_id);
 
  select * from customers where exists
 (select 1 from orders where orders.customer_id=customers.customer_id 
 and orders.status='Delivered');
 
 select * from customers where exists
 (select 1 from orders where orders.customer_id=customers.customer_id 
 and orders.status='Delivered')
 and exists 
(select 1 from orders where orders.customer_id=customers.customer_id 
 and orders.status='pending');
 
 
 
 
 