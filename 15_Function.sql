---------------------------------------------------------FUNCTIONS---------------------------------------
create or replace function getTotoalSailors return int
as
v_count int;
begin
select count(*) into v_count from sailors;
return v_count;
end;
--DRIVER CODE
begin
dbms_output.put_line(getTotoalSailors());
end;
---------------------------------------------------------------------
--PARAMETER FUNCTION
create or replace function getAvgRating(dat date) return int
as
rat int;
begin
select avg(rating) into rat from sailors where dob<=dat; 
return rat;
end;
--DRIVER CODE
declare
d date:='&d';
begin
dbms_output.put_line(getAvgRating(d));
end;