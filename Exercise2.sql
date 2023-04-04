[Exercise 1]
CREATE DATABASE Exercise1;
CREATE TABLE EMP_1(EMP_NUM CHAR(3),EMP_Lname VARCHAR(15),EMP_FNAME VARCHAR(15),EMP_INITIAL CHAR(1),EMP_HIREDATE DATE,JOB_CODE CHAR(3));
INSERT INTO EMP_1(EMP_NUM, EMP_Lname, EMP_FNAME, EMP_INITIAL, EMP_HIREDATE, JOB_CODE)
VALUES('1','Ibarra','Crisostomo','J','2023-03-27','501'),('2','Maria','Clara','C','2023-03-28','502'),('3','Tiago','Capitan','B','1995-08-12','502');
SELECT * FROM emp_1;
SELECT * FROM emp_1 WHERE JOB_CODE = '502';

[Exercise 2]
alter table EMP_1 DROP COLUMN EMP_Address;
SELECT * FROM emp_1;
alter table EMP_1 CHANGE EMP_Lname EMP_LNAME VARCHAR(15);
UPDATE EMP_1 SET EMP_NUM = '101',EMP_LNAME = 'NEVAS',EMP_FNAME = 'JOHN',EMP_INITIAL = 'G',EMP_HIREDATE = '1994-11-08',JOB_CODE ='502' WHERE EMP_NUM = '101';
UPDATE EMP_1 SET EMP_NUM = '102',EMP_LNAME = 'SENIOR',EMP_FNAME = 'DAVID',EMP_INITIAL = 'H',EMP_HIREDATE = '1987-07-12',JOB_CODE ='501' WHERE EMP_NUM = '2';
UPDATE EMP_1 SET EMP_NUM = '103',EMP_LNAME = 'ARBOS',EMP_FNAME = 'JUNE',EMP_INITIAL = 'E',EMP_HIREDATE = '1996-12-01',JOB_CODE ='500' WHERE EMP_NUM = '3';
INSERT INTO EMP_1(EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL, EMP_HIREDATE, JOB_CODE)
VALUES('104','RAMORAS','ANNE','K','1998-11-15','501'),('105','JOSON','ALICE','P','1993-02-01','502'),('106','SMITH','WILLIAM','D','1990-06-23','500'),('107','ALONSO','MARA','F','1991-10-10','500'),('108','WASHINGTON','RAF','S','1989-08-22','501'),('109','FIELD','LARRY','W','1999-07-18','501');
SELECT * FROM emp_1;

UPDATE EMP_1 SET JOB_CODE = '501' WHERE EMP_NUM = '106';
SELECT * FROM emp_1;

DELETE FROM EMP_1 WHERE EMP_NUM = '106';
SELECT * FROM emp_1;