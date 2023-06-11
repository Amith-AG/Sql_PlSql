--****if elsif else condition****
--declare
--a number(3):=5;
--begin
--if a<5 then
--dbms_output.put_line('a is less than 5');
--elsif a=5 then
--dbms_output.put_line('a is eqals than 5');
--else
--dbms_output.put_line('a is greater than 5');
-- end if;
--end;

-- ****case statement****
declare
grade char:='a';
begin
case grade
when 'b' then dbms_output.put_line('grade is  b');
when 'c' then dbms_output.put_line('grade is  c');
when 'n' then dbms_output.put_line('grade is  n');
when 'a' then dbms_output.put_line('grade is  a');
end case;
end;


