create database task2;


CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name text  NOT NULL,
    age INTEGER,
    contact_no TEXT
);
insert into students value (1,"BOB", 20, 4587632159);
insert into students value (2,"CHARLI", NULL, 3654789125);
insert into students value (3,"RAHUL", 26, NULL);
insert into students value (4,"SNEHA", 22, 6943475616);
insert into students value (5,"PRIYA", 24, NULL);
insert into students value (6,"ANU", NULL, 4578667310);

UPDATE students SET AGE=25 WHERE STUDENT_ID =2;
select* FROM students;
UPDATE students SET CONTACT_NO=3469721568 WHERE STUDENT_ID =3;
UPDATE students SET CONTACT_NO=4397568137  WHERE STUDENT_ID =5;
UPDATE students SET AGE=21  WHERE STUDENT_ID =6;

delete FROM STUDENTS WHERE STUDENT_ID=4;
delete FROM STUDENTS WHERE STUDENT_ID=6;
