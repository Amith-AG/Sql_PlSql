------------------------------------------------PACKAGE--------------------------------------------------------------------
--display
select* from employee;
--package specification
create or replace package emp as
procedure hire(e int,ename varchar2,salary int,exp int);
procedure fire(e int);
function sumsal return int;
end;
--package body
create or replace package body emp as
procedure hire(e int,ename varchar2,salary int,exp int)as
begin
insert into employee values(e,ename,salary,exp);
commit;
end hire;
procedure fire(e int)as
begin
delete from employee where eno=e;
end fire;
function sumsal return int as
amout int;
begin
select sum(salary) into amout from employee;
return amout;
end sumsal;
end;
--DRIVER CODE
execute emp.hire(2,'appu',30,4);
execute emp.hire(3,'appuka',32,41);
execute emp.hire(4,'appucha',33,4);
execute emp.hire(5,'appusa',34,44);
execute emp.hire(6,'fappusa',34,44);
execute emp.hire(7,'kappusa',34,44);


execute emp.fire(2);
execute emp.fire(4);
execute emp.fire(7);
execute emp.fire(3);


begin
dbms_output.put_line(emp.sumsal());
end;