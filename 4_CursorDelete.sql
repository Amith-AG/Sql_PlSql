--create table employee(eno number(8)primary key,ename varchar2(30),salary number(8),exp number(3));
insert into employee values(1,'amith',900000,90);
insert into employee values(2,'suraj',8000,4);
insert into employee values(3,'ciril',800,1);
insert into employee values(4,'aith',9000,9);
insert into employee values(5,'uraj',800,4);
insert into employee values(6,'cil',80,13);
----update employee set salary=800080 where eno=1;
select *from employee;
--cursor fetch method
declare
emp employee%rowtype;
cursor c is select * from employee where exp<5 for update;
begin
open c;
loop
fetch c into emp;
exit when c%notfound;
--delete from employee where current of c;
--dbms_output.put_line('row deleted');
update employee set salary=salary+20 where current of c;
dbms_output.put_line('row updated');
end loop;
close c;
end;
--or you can do this
declare
emp employee%rowtype;
cursor c is select * from employee for update;
begin
for emp in c loop
if emp.exp <5 then
--delete from employee where current of c;
--dbms_output.put_line('row updated');
update employee set salary=salary+20 where current of c;
dbms_output.put_line('row updated');
end if;
end loop;
end;