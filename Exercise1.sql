CREATE DATABASE Exercise1;
CREATE TABLE EMP_1(EMP_NUM CHAR(3),EMP_Lname VARCHAR(15),EMP_FNAME VARCHAR(15),EMP_INITIAL CHAR(1),EMP_HIREDATE DATE,JOB_CODE CHAR(3));
INSERT INTO EMP_1(EMP_NUM, EMP_Lname, EMP_FNAME, EMP_INITIAL, EMP_HIREDATE, JOB_CODE)
VALUES('1','Ibarra','Crisostomo','J','2023-03-27','501'),('2','Maria','Clara','C','2023-03-28','502');
SELECT * FROM emp_1;
SELECT * FROM emp_1
WHERE JOB_CODE = '502';