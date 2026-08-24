create database viewdb2;

use viewdb2;

create table employee(id int, name varchar(20), salary int);
insert into employee values(1,'amar',10000),(2,'shivank',20000);

-- create is used to create view object
-- object data structure

create view emp_view as select id, name from employee;

select * from emp_view;

select salary from emp_view;

-- row new insert
insert into employee values(3,'abhishek',30000);

select * from emp_view; -- base table change view also got new data

insert into emp_view values(4,'raj'); -- view insert as per column
select * from emp_view;
select * from employee;

create view emp_view_sum as select sum(salary) from employee;
select * from emp_view_sum;
insert into emp_view_sum values(80000); -- view is not insertable


create table employee2(id int, name varchar(20), salary int);
insert into employee2 values(1,'aman',1000),(2,'shiv',2000);

create table employee3(id int, name varchar(20), salary int);
insert into employee values(1,'a',100),(2,'s',200);

create view emp as select id, name from employee2;

