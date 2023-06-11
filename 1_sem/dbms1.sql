create database emplooyes;
use emplooyes;
create table emp(id int,fname varchar(20),lname varchar(20),email varchar(20),hiredate varchar(20),no bigint,primary key(id));
Insert into emp values (126,'Thomas','Philip','thomas1@mail','1/1/11',9605360424);
Insert into Emp values (124,'Mohan','Das','mohan2@mail','2/1/11',8129878003);
Insert into Emp values(121,'Anoop','Raju','anoop3@mail','3/1/11',8136860424);
Insert into Emp values(123,'Kiran','Rajeev','kiran4@mail','4/1/11',6238230957);
Insert into Emp values(125,'Arun','Nath','arun21@mail','5/1/11',9074800345);
select* from emp;

update emp set no=9999999999 where id=124;
alter table emp add salary bigint;
update emp set salary=20 where id=126;
update emp set salary=2023 where id=124;
update emp set salary=20333 where id=121;
update emp set salary=222222 where id=125;
update emp set salary=22220 where id=123;
select * from emp where salary>=200 and salary<=20000000;
select fname from emp order by fname;


