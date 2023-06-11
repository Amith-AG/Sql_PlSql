--------------------------------------------------collection----------------------------------------------
--varray
select * from employee;
declare
type array is varray(10) of varchar2(30);
coll array;
begin
select ename bulk collect into coll from employee;
dbms_output.put_line(coll(3));
end;
-------------------------------------------------
--nested table
declare
type array is table of varchar2(30);
coll array;
begin
select ename bulk collect into coll from employee;
dbms_output.put_line(coll(1));
end;
---------------------------------------------------------------
declare
type array is table of number index by varchar2(30);
mark array;
begin
mark('amith'):=123;
mark('zamith'):=126;
mark('eamith'):=125;
mark('pamith'):=123;
mark('kamith'):=123;

dbms_output.put_line(mark('amith'));
end;