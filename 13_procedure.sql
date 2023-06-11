---------------------------------------------PROCEDURE-------------------------------------
--HELLOWORLD PROCEDURE PROGRAM
create or replace procedure kello
as
begin
dbms_output.put_line('hello world');
end;
execute kello;
---------------------------------------------------------------------------------------------------
--IN PARAMETER(DEFALT)
create or replace procedure maxnum(a number,b number) as
begin
if a>b then
dbms_output.put_line('a is greater than b');
else
dbms_output.put_line('b is greater than a');
end if;
end;

--DRIVER CODE WHICH CALL MAXNUM PROCEDURE
declare
a number:=&a;
b number:=&b;
begin
maxnum(a,b);
end;
----------------------------------------------------------------------------------------------------------------
--PRCEDURE PROGRAM TO INSERT INTO TABLE
select* from employee;
create or replace procedure intemp(eeno number,eename varchar2,esalary number,eexp number)as
begin
insert into employee values(eeno,eename,esalary,eexp);
end;
--DRIVER CODE
execute intemp(1,'amith',3000,4);
-----------------------------------------------------------------------------------------------------------
--out parameter
create or replace procedure maxvalue( a int,b int,z out int) as
begin
if a>b then
z:=a; --returns
else
z:=b;
end if;
end;
--DRIVER CODE
declare
x int;
begin
maxvalue(59,132,x);
dbms_output.put_line('value of x is '||x);
end;
--------------------------------------------------------------------------------------------------------
--in out parameter
create or replace procedure squarenum(a in out int) as
begin
a:=a*a;
end;
--DRIVER CODE
declare
s int:=&s;
begin
squarenum(s);
dbms_output.put_line('square of s='||s);
end;
