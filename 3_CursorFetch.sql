--create table employee(empid number(8) primary key,ename varchar2(30),e_add varchar2(30));
--insert into employee values(1,'amith','aaa');
--insert into employee values(2,'aith','aa=va');
--insert into employee values(3,'amoth','aac');
--cursor
declare
e_id employee.empid%type;
e_name employee.ename%type;
cursor c_employee is select empid,ename from employee;
begin
open c_employee;
loop
fetch c_employee into e_id,e_name;
exit when c_employee%notfound;
dbms_output.put_line(e_id||e_name);
end loop;
close c_employee;
end;