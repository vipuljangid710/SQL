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
 
 
 
 
 insert into employee_c values(5,'aman',250);
 
 
 
 
 select * from employee_c where salary=(select salary from employee_c where name='b');
 
 
 
 
 use world;
 
 select * from city where district = ( select name from city where Name = "Abu Dhabi");
 
 select * from city where population =(select max(population)from city);
 
 
 
 
 
 