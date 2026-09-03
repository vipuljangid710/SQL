use newdb2;
drop table test8;

create table test8(id int, name varchar(20));

insert into test8 values(1,'a'),(2,'b'),(3,'c'),(4,'d'),(7,'d'),(8,'d');

explain select * from test8 where id=3;

-- BTree data structure (indexes are stored in)


-- clustered indexes (primary key) 

alter table test8 add primary key (id);

desc test8;

select * from test8;

explain select * from test8 where id = 3;

-- non_clustered indexing

create index name_index on test8(name);

show indexes from test8;
select * from test8;
explain select * from test8 where name='d';

-- id name age insert data in it create index on name and age filter data on name check which index is used

 create table test9(id int, name varchar(20), age int);
 insert into test9 values(1,'a',20),(2,'b',25),(3,'c',30),(4,'d',35),(7,'d',40),(8,'d',45);
 create index name_index on test9(name,age);
 
 
 
 show index from test9;
 
 
 