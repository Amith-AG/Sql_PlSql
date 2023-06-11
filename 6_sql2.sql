--QUESTION 2:
--
--Supplier (sid, sname, contactnum)
--Parts (pid, pname, color, unit rate)
--Catalog (sid, pid, qty)
create table supplier(sid number(8) primary key,sname varchar2(30),contact number(12));
create table parts(pid number(8) primary key,pname varchar2(30),unit_rate number(8));
create table catalog(sid number(8) references supplier(sid),pid number(8) references parts(pid),qty number(8));
--insert into supplier
insert into supplier values(1,'bmi',8888);
insert into supplier values(2,'amazon',3434);
insert into supplier values(3,'microsoft',9898);
insert into supplier values(4,'bigdata',6554);
insert into supplier values(5,'yahoo',4532);
insert into supplier values(6,'yamaha',5123);
insert into supplier values(7,'bugatti',9830);
--insert into parts
insert into parts values(10,'engine',500);
insert into parts values(11,'bulb',7);
insert into parts values(12,'brake',80);
insert into parts values(13,'seat',8);
insert into parts values(14,'stering',10);

--insert into catalog
insert into catalog values(1,10,5);
insert into catalog values(2,13,4);
insert into catalog values(1,12,1);
insert into catalog values(3,14,1);
insert into catalog values(4,12,100);
insert into catalog values(5,13,50);
insert into catalog values(6,10,20);
--table
select* from supplier;
select* from parts;
select* from catalog;
--Implement the Following
--1. Find those suppliers who haven’t ordered any Parts..
select * from supplier where sid in(select sid from supplier minus select sid from catalog);
--2. Create a View that displays the supplier details who have ordered any item having unit rate greater than Rs.500.
create or replace view view_supplier as select sname,pname,unit_rate from supplier s join catalog c on(s.sid=c.sid) join parts p on(p.pid=c.pid) where unit_rate>50;
select * from view_supplier;

