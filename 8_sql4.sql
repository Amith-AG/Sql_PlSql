--QUESTION 4:
--Employee Master (Emp_Code, Emp_Name, Birth_Date)
--Department Master (Dept_Code, Dept_Name, Budget)
--Salary (Dept_Code, Emp_Code, Salary)
create table e_master(e_code varchar2(4) primary key,ename varchar2(30),dob date);
create table d_master(d_code varchar2(4) primary key,dname varchar2(30),bud number(9));
create table salary(d_code varchar2(4) references d_master(d_code),e_code varchar2(4) references e_master(e_code),salary number(9));
--insert
insert into e_master values('e001','amith','19/09/2000');
insert into e_master values('e002','aith','09/09/1990');
insert into e_master values('e003','sur','9/09/2099');
insert into e_master values('e004','thamath','19/09/2990');

insert into d_master values('d001','mca',900000);
insert into d_master values('d002','bca',10000);
insert into d_master values('d003','zca',9000);
insert into d_master values('d004','sca',9001);

insert into salary values('d001','e001',9999999);
insert into salary values('d002','e001',9999999);
insert into salary values('d001','e003',99999);
insert into salary values('d003','e002',99999);
insert into salary values('d004','e004',999999);
insert into salary values('d003','e004',999999);

--display
select * from e_master;
select * from d_master;
select * from salary;

--Implement the following:
--1. Count the number of employee in each department.
select dname,count(*)emp_no from e_master e join salary s on(s.e_code=e.e_code)join d_master d on (d.d_code=s.d_code) group by dname order by 2 desc;
--2. Create a view to display employee name & its salary.
create or replace view v_emp as select ename,salary from e_master e join salary s on(s.e_code=e.e_code)join d_master d on (d.d_code=s.d_code);
select * from v_emp;