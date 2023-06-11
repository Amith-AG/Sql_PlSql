--create table staff(id number(8) primary key,name varchar2(30),age number(8),address varchar2(30),salary number(8));
----insert values
--insert into staff values(1,'anu',23,'pearl',20000);
--insert into staff values(2,'cina',23,'rose',20000);
--insert into staff values(3,'bina',23,'kitti',30000);
--insert into staff values(4,'dinu',23,'garden',4000);
----update salary values of id =4
--update  staff set salary=40000 where id=4;
----print
--select* from staff;
--Create a program to display the details of STAFF using Curser.
DECLARE
    c_id   staff.id%TYPE;
    c_name staff.name%TYPE;
    c_age  staff.age%TYPE;
    CURSOR c_staff IS
    SELECT
        id,
        name,
        age
    FROM
        staff;

BEGIN
    OPEN c_staff;
    LOOP
        FETCH c_staff INTO
            c_id,
            c_name,
            c_age;
        EXIT WHEN c_staff%notfound;
        dbms_output.put_line(c_id
                             || ' '
                             || c_name
                             || ' '
                             || c_age);
       dbms_output.put_line('amithsuperman');

    END LOOP;

    CLOSE c_staff;
END;

