------------------------------------------------------EXCEPTION HANDLING--------------------------------------------------------
declare
name sailors.sname%type;
begin
select sname into name from sailors where sid=2;
dbms_output.put_line(name);
exception when no_data_found then
dbms_output.put_line('no data');
when others then
dbms_output.put_line('other execption');
end;
