--QUESTION 5:
--Subject_Master (Sub_code, Sub_name)
--Student_Master (Roll_no, Stud_Name, Gender, DOB, Address)
--Result (Roll_No, Sub_code, Marks)
create table sub_master(scode varchar2(4)primary key,sname varchar2(30));
create table stu_master(roll_no number(8) primary key,stname varchar2(30),gen varchar2(10),dob date,addr varchar2(30));
create table result(roll_no number(8) references stu_master(roll_no),scode varchar2(4) references sub_master(scode),mark number(3));
--insert
insert into sub_master values('s001','english');
insert into sub_master values('s002','maths');
insert into sub_master values('s003','science');
insert into sub_master values('s004','history');
insert into sub_master values('s005','hindi');
delete from sub_master where scode='s003';
delete from sub_master where scode='s004';
delete from sub_master where scode='s005';


insert into stu_master values(1,'amith','male','19/09/2000','sooranad');
insert into stu_master values(2,'aith','male','09/09/2050','pooranad');
insert into stu_master values(3,'jith','female','19/09/2010','zooranad');
insert into stu_master values(4,'sith','male','19/09/2001','sooranad');
insert into stu_master values(5,'wamith','female','19/09/2010','sooranad');
insert into stu_master values(6,'pamith','male','17/09/2040','sooranad');
delete from stu_master where roll_no=3;
delete from stu_master where roll_no=4;
delete from stu_master where roll_no=5;
delete from stu_master where roll_no=6;

insert into result values(1,'s001',25);
insert into result values(1,'s002',25);
insert into result values(2,'s001',85);
insert into result values(2,'s002',75);


--display
select* from sub_master;
select* from stu_master;
select* from result;
--Implement the following:
--1). Find out the average score in percentage for each subject.
select sname,round(avg(mark),2) from sub_master s join result r on(s.scode=r.scode) group by sname;
--2). Find out the students whose birthday falls into leap year.
select * from stu_master where mod(to_char(dob,'yyyy'),4)=0;
