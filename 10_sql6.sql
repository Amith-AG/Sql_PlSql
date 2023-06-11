--QUESTION 6:
--Account (ac_no, ac_name, act_type)
--Transaction (ac_no, trans_date, tran_type, tran_amount, balance)
--Note: Act_type may be ‘S’ for saving or ‘C’ for current and tran_type may be ‘D’ for deposit or ‘W’ for withdrawal.
create table account(acno number(5) primary key,acname varchar2(10),actype varchar2(1));
create table tran(acno number(5) references account(acno),tdate date,ttype varchar2(1),tamt number(9),bal number(9));
--insert
insert into account values(23232,'amith','s');
insert into account values(23233,'aith','c');
insert into account values(23234,'wamith','s');
insert into account values(23235,'pamith','c');

insert into tran values(23232,'11/01/2023','d',100,200);
insert into tran values(23232,'11/01/2023','w',10,190);
insert into tran values(23233,'11/01/2023','d',10,50);
insert into tran values(23234,'11/01/2024','w',100,0);
insert into tran values(23235,'11/01/2025','d',10,20);
insert into tran values(23235,'11/01/2020','w',100,200);
insert into tran values(23235,'11/01/2015','w',1000,20);
insert into tran values(23232,'11/01/2015','d',1000,2020);

truncate table tran;

--display
select * from account;
select* from tran;
--Implement the following:
--1.	 Find out those saving transactions that took place between 10th January 2011 and 20th January 2011 and have withdrawn an amount greater than Rs. 50,000.
select a.acno,acname,tdate,tamt,bal from account a join tran t on(t.acno=a.acno) where tdate between'20/01/11' and'20/9/25' and ttype='w' and tamt>5;
--2.	Create a View that display the account information having a balance greater than Rs. 1,00,000.
create view v_bal as select a.acno,acname,bal from account a join tran t on (t.acno=a.acno) where bal>100;
select* from  v_bal;

--3. Find out those saving transactions that took place between 10th January 2011 and 20th January 2011 and have withdrawn an amount greater than Rs. 50,000.
select a.acno,acname,tdate,tamt,bal from account a join tran t on(t.acno=a.acno) where tdate between'20/01/11' and'20/9/23' and ttype='w' and actype='s' and tamt>5;