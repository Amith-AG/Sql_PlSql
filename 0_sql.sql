Create table Sailors (sid int primary key, sname varchar2(20), rating int, age 
decimal(4,1));
create table Boats(bid int primary key,bname varchar2(20),color VARCHAR2(30));
create table Reserves(sid int references Sailors(sid),bid int references Boats(bid),day date);
--sailor
insert into Sailors values(22,'Dustin',7,45.0);
insert into Sailors values(29,'Brutus',1,33.0);
insert into Sailors values(31,'Lubber',8,55.5);
insert into Sailors values(32,'Andru',8,25.5);
insert into Sailors values(58,'Rusty',10,35.0);
insert into Sailors values(64,'Horataio',7,35.0);
insert into Sailors values(71,'Zorba',10,16.0);
insert into Sailors values(85,'Art',3,25.5);
insert into Sailors values(95,'Bob',3,63.5);
--boat
insert into Boats values(101,'Interlake','blue');
insert into Boats values(102,'Interlake','red');
insert into Boats values(103,'Clipper','green');
insert into Boats values(104,'Marine','red');
--reserves
insert into Reserves values(22,101,'10-OCT-98');
insert into Reserves values(22,102,'10-OCT-98');
insert into Reserves values(22,103,'8-OCT-98');
insert into Reserves values(22,104,'7-OCT-98');
insert into Reserves values(31,102,'10-Nov-98');
insert into Reserves values(31,103,'6-NOV-98');
insert into Reserves values(31,104,'12-NOV-98');
insert into Reserves values(64,101,'5-SEP-98');
insert into Reserves values(64,102,'8-SEP-98');
insert into Reserves values(71,103,'8-SEP-98');
--print table
select* from Sailors;
select*from boats;
select*from reserves
--1. Find the names and ages of all sailors.
select sname,age from sailors;
--2. Find all sailors with a rating above 7.
select rating from sailors where rating>7;
--3. Find the names of sailors who have reserved boat number 103.
select distinct s.sid,s.sname from sailors s,reserves r where s.sid=r.sid and r.bid=103;
--4. Find the names of sailors who have reserved a Red boat
select distinct s.sid,s.sname,b.color from sailors s,reserves r,boats b where s.sid=r.sid and r.bid=b.bid and b.color='red';
--6. Find the names of sailors who have reserved at least one boat.
select distinct s.sname from sailors s,reserves r where s.sid=r.sid;
--7. Find the names of sailors who have reserved boat 103
select s.sname from sailors s,reserves r where s.sid=r.sid and r.bid=103;
--8. Find the sids of sailors who have reserved a red boat
select r.sid from reserves r,boats b where b.bid=r.bid and color='red';
--9. Find the names of sailors who have reserved a red boat 
select s.sname from sailors s,reserves r,boats b where s.sid=r.sid and b.bid=r.bid and color='red';
--10. Find the colors of boats reserved by �Lubber
select b.color from sailors s,reserves r,boats b where s.sid=r.sid and b.bid=r.bid and s.sname='Lubber';
--11. Find the names of sailors who have reserved at least one boat
--refere q 6
--12. Find the names of sailors who have reserved a red or a green boat
select s.sname,b.color from sailors s,reserves r,boats b where s.sid=r.sid and b.bid=r.bid and b.color='red' union select s.sname,b.color from sailors s,reserves r,boats b where s.sid=r.sid and b.bid=r.bid and b.color='green';
--13. Findsid of sailors who�ve reserved a red and a green boat     
select r.sid from sailors s,boats b,reserves r where s.sid=r.sid and b.bid=r.bid and b.color='red' intersect select r.sid from sailors s,boats b,reserves r where s.sid=r.sid and b.bid=r.bid and b.color='green';
--14. Find names of sailors who have reserved boat 103 (using IN)
select s.sname from sailors s where sid in(select r.sid from reserves r where r.bid=103);
--15. Find names of sailors who have not reserved boat 103
select s.sname from sailors s where s.sid not in(select r.sid from reserves r where r.bid=103);
--16. Find the name and the age of the youngest sailor
select sname,age from sailors where age<=all(select age from sailors)
--17. Find the average age of sailors for each rating level.
select rating, avg(age) as average from sailors group by rating;
--18. Find the average age of sailors for each rating level that has at least two sailors
select rating,avg(age) from sailors group by rating having count(*)>1;
--19. Find the names of sailors who have reserved a red boat.
select s.sname from sailors s join reserves r on s.sid=r.sid join boats b on b.bid=r.bid where b.color='red';
--20. Find the names of the Sailors who have reserved at least one boat.
select sname from sailors where sid in(select sid from reserves group by sid);
--21.Count the number of different sailor names.
select count(*) from(select sname from sailors group by sname);
--22.Find the no. of sailors who is eligible to vote for eachrating level.
select count(sname),rating from sailors where age>=18 group by rating;