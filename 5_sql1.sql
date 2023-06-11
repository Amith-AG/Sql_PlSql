--QUESTION 1:
--Sailor (sid, sname, rating (0-10), DOB)
--Boat (bid, bname, color)
--Reserve (sid, bid, date)
create table reserve(sid number(8) references sailors(sid),bid number(8) references boats(bid),d_date date);
--print table
select* from Sailors;
select*from boats;
select*from reserves;

--Implement the following:
--  
--1.	Find the sailor(s) whose birthday fall in a leap year.
select * from sailors where mod(to_char(dob,'yyyy'),4)=0; 
--2.	Find the name of the sailor who has not reserved the red colored boat. 
--select s.sname,b.bname,b.color from sailors s,boats b,reserves r where s.sid=r.sid and b.bid=r.bid and b.color!='red';
select sname,bname,color from sailors s  join reserves r on(s.sid=r.sid) join boats b on(b.bid=r.bid)where color!='red';
--3.	Find the name of the sailor who is youngest among all.
select * from(select sname,dob from sailors order by 2 desc)where rownum<=1;
--4.	Write a curser program to find the details of sailor.
declare
s_id sailors.sid%type;
s_name sailors.sname%type;
s_rating sailors.rating%type;
cursor sur_sail is select sid,sname,rating from sailors;
begin
open sur_sail;
loop
fetch sur_sail into s_id,s_name,s_rating;
exit when sur_sail%notfound;
dbms_output.put_line(s_id||' '||s_name||' '||s_rating);
dbms_output.put_line('suraj is superman');
end loop;
close sur_sail;
end;
--5. Find the name of the sailor who has reserved either the red or green colored boat.
select sname,color,dates from sailors s join reserves r on(s.sid=r.sid)join boats b on(b.bid=r.bid)where color in('red','green');


