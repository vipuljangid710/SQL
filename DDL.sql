create database testdb;
use testdb;
-- table structure
create table testdb.employee(id int);
select * from testdb.employee;
-- DDL (Alter)
alter table testdb.employee add column name varchar(30); -- add a column
alter table testdb.employee drop column id; -- drop a column

select * from testdb.employee;

desc testdb.employee;
alter table testdb.employee modify column name int; -- changed the data type

desc testdb.employee;

alter table testdb.employee add column empid int; -- add acolumn
alter table testdb.employee add constraint unique(name);

alter table testdb.employee modify column empid int NOT NULL; -- not null on a table column
alter table testdb.employee modify column empid int PRIMARY KEY;
desc testdb.employee;

alter table testdb.employee rename column empid to id; -- rename column
alter table testdb.employee rename to employee2; -- table rename
desc testdb.employee2;

-- Truncate

select * from testdb.employee2;
insert into testdb.employee2 values(100,80);

truncate testdb.employee2; -- fiorst it drop the table then recreate the table again.
select * from testdb.employee2;

desc testdb.employee2;
alter table testdb.employee2 drop constraint name; -- remove unique constraint

select * from testdb.employee2;
insert into testdb.employee2 values(10,199), (13,200), (11,899), (12,5738), (10,10910);
update testdb.employee2 set name ='899'; -- will make changes to every row

SET SQL_SAFE_UPDATES = 0;

update testdb.employee2  set name = '7123' where id = '199'; -- condition

delete from testdb.employee2 where name = '10';

select * from testdb.employee2;






