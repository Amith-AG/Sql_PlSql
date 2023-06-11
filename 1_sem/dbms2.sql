create table emp(empno int,ename varchar(20),job varchar(20),mgr int,hiredate varchar(20),sal int,commission int,deptno int,primary key(empno));
create table dep(deptno int,dname varchar(20),loc int);
--insert emp
insert into emp values(1,'amith','principal',null,'10/10/1000',1000000,10,10);
insert into emp values(2,'sai','clerk',null,'20/10/1900',1000,1,10);
insert into emp values(5,'rocky','teacher',null,'2/12/1000',10000,1,30);
insert into emp values(3,'roosy','teacher',3,'1/12/1800',1000,2,40);
insert into emp values(3,'lola','clerk',Null,'2/12/2020',100,2,40);
select  empno,ename,job,mgr,hiredate,sal,commission,deptno from emp;
--insert dep
insert into dep values(10,'office','1');
insert into dep values(10,'office','2');
insert into dep values(30,'maths','3');
insert into dep values(40,'ttm','5');
update dep set deptno=10 where deptno=20;
select deptno,dname,loc from dep;
--1. How many clerks are there in the company?
select count(*)from emp where job= 'CLERK'; 
--2. How many employees are there in each department?
select deptno,count(*)from emp group by deptno;
--3. List the lowest salary for different jobs used in a company and list them in descending order.
 select job,min(sal)from emp group by job order by min(sal) desc;
 --4. List the minimum, maximum and average salary for each job
 select job, min(sal), max(sal), avg(sal)from emp group by job;
 --5 List the names of the employees whose name starts with A.
select ename from emp where ename like 'A%';
--6. List the names of the employees whose name contains A.
 select ename from emp where ename like '%A%';
 --7. Select the details of the department having deptno=20 and deptno=30.
 select * from emp where deptno=20 or deptno=30;
 --8. Select the details of the employees whose mgr is not null.
 select * from emp where mgr is not null;
 --9. How many different job titles exist in the employee table?
select job, count(job) from emp group by job;
 
--10. List the minimum and maximum salaries.
select min(sal),max(sal) from emp;
 
--11. Compute the difference between maximum amd minimum salary
select max(sal)-min(sal) from emp;
 
--12. Compute the sum of all salaries of employee working under deptno=30.
select sum(sal) from emp where deptno=30;

 


 

 








  

