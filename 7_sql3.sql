--QUESTION 3:
--Movie (movie_id, movie_name, date_of_release)
--Screen (screen_id, location, max_capacity)
--Current (movie_id,screen_id, date_of_arrival, date_of_closure)
create table movie(movie_id varchar2(4)primary key check(movie_id like 'm%'),movie_name varchar2(30),dor date);
create table screen(screen_id varchar2(4)primary key check(screen_id like 's%'),loc varchar2(30),max_cap number(8));
create table current1(movie_id varchar2(4)references movie(movie_id),screen_id varchar2(4) references screen(screen_id),doa date,doc date);
drop table curent;
--insert
insert into movie values('m001','ab','19/09/2023');
insert into movie values('m002','ac','15/01/2009');
insert into movie values('m003','ad','16/11/2019');
insert into movie values('m004','ae','25/12/2019');

insert into screen values('s001','new york',300);
insert into screen values('s002','new jersey',3010);
insert into screen values('s003','adoor',3020);
insert into screen values('s004','patharam',30000);
insert into screen values('s005','pullika mukk',300000);

insert into current1 values('m001','s003','10/10/2010','12/12/2010');
insert into current1 values('m001','s001','10/11/2010','12/12/2010');
insert into current1 values('m002','s002','01/01/2010','10/01/2010');
insert into current1 values('m003','s003','10/10/2010','12/12/2010');
insert into current1 values('m001','s003','30/10/2010','12/12/2010');
insert into current1 values('m004','s003','10/10/2010','12/12/2010');
insert into current1 values('m004','s003','11/02/2011','12/12/2011');
insert into current1 values('m001','s003','20/10/2010','12/12/2010');

--display
select* from movie;
select * from screen;
select * from current1;

--1.	Create a View which displays the movie details along with the information about the screen on which it is currently screened.
create or replace view view_mov as select movie_name,s.screen_id,loc,dor from movie m join current1 c on (m.movie_id=c.movie_id) join screen s on(s.screen_id=c.screen_id);
select* from view_mov;
--2.	Get the details of movie that closed on date 15-January-2010.
select movie_name,s.screen_id,loc,dor from movie m join current1 c on (m.movie_id=c.movie_id) join screen s on(s.screen_id=c.screen_id) where doc='10/01/2010';

