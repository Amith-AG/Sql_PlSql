create table student(sid number(8) primary key,sname varchar2(30),m1 number(3),m2 number(3),m3 number(3));
insert into student values(1,'amith',100,99,98);
insert into student values(2,'suraj',30,100,90);
insert into student values(3,'ribi',29,98,37);
insert into student values(4,'ciril',10,99,98);
SELECT * FROM student;
--cursor
declare 
stu student%rowtype; 
total number(4);
result varchar(4);
cursor c_student is
SELECT
    *
FROM
    student;

BEGIN

    FOR stu IN c_student LOOP
        dbms_output.put_line('STUDENT_MARKLIST');
        dbms_output.put_line('sno:'
                            || stu.sid
                            || ' sname:'
                            || stu.sname);

        total := stu.m1 + stu.m2 + stu.m3;
        IF
            stu.m1 > 35
            AND stu.m2 > 35
                AND stu.m3 > 35
        THEN
            result := 'pass';
        ELSE
            result := 'fail';
        END IF;

        dbms_output.put_line('english:'
                            || stu.m1
                            || ' science:'
                            || stu.m2
                            || ' maths:'
                            || stu.m3);

        dbms_output.put_line('total:'
                            || total
                            || ' result:'
                            || result);
        dbms_output.put_line('________________________________');
    END LOOP;

END;