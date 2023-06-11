------****basic loop ****
declare
a number(2);
b number(2);
begin
a:=5;
b:=1;
loop
exit when b>10;
dbms_output.put_line(a||'*'||b||'='||a*b);
b:=b+1;
end loop;
end;
--***while loop**
declare
a number(2);
b number(2);
begin
a:=5;
b:=1;
while b<=10 loop
dbms_output.put_line(a||'*'||b||'='||a*b);
b:=b+1;
end loop;
end;
--***for loop**
declare
a number(2):=5;
b number(2):=1;
begin
for b in 1..10 loop
dbms_output.put_line(a||'*'||b||'='||a*b);
end loop;
end;
--****implementing in sql queries
select * from sailors;
begin
for info in(select sname,dob from sailors)
loop
dbms_output.put_line('name:'||info.sname||' dob:'||info.dob);
end loop;
end;