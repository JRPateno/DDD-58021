CREATE DATABASE ABC_Computer;

CREATE TABLE Computer(SerialNumber INT Primary Key, 
                       Make VARCHAR(12), 
                       Model VARCHAR(24), 
                       ProcessorType VARCHAR(24),
                       ProcessorSpeed DECIMAL(3,2),
                       MainMemory VARCHAR(15),
                       DiskSize VARCHAR(15));
					
INSERT INTO Computer(SerialNumber, Make, Model, ProcessorType, ProcessorSpeed, MainMemory, DiskSize)
VALUES ('9871234','HP','Pavilion 500-210qe','Intel i5-4530','3.00','6.0 Gbytes','1.0 Tbytes'),
	   ('9871245','HP','Pavilion 500-210qe','Intel i5-4531','3.00','6.0 Gbytes','1.0 Tbytes'),
       ('9871256','HP','Pavilion 500-210qe','Intel i5-4532','3.00','6.0 Gbytes','1.0 Tbytes'),
       ('9871267','HP','Pavilion 500-210qe','Intel i5-4533','3.00','6.0 Gbytes','1.0 Tbytes'),
       ('9871278','HP','Pavilion 500-210qe','Intel i5-4534','3.00','6.0 Gbytes','1.0 Tbytes'),
       ('9871289','HP','Pavilion 500-210qe','Intel i5-4535','3.00','6.0 Gbytes','1.0 Tbytes'),
       ('6541001','Dell','OptiPlex 9020','Intel i7-4770','3.00','8.0 Gbytes','1.0 Tbytes'),
       ('6541002','Dell','OptiPlex 9021','Intel i7-4771','3.00','8.0 Gbytes','1.0 Tbytes'),
       ('6541003','Dell','OptiPlex 9022','Intel i7-4772','3.00','8.0 Gbytes','1.0 Tbytes'),
       ('6541004','Dell','OptiPlex 9023','Intel i7-4773','3.00','8.0 Gbytes','1.0 Tbytes'),
       ('6541005','Dell','OptiPlex 9024','Intel i7-4774','3.00','8.0 Gbytes','1.0 Tbytes'),
       ('6541006','Dell','OptiPlex 9025','Intel i7-4775','3.00','8.0 Gbytes','1.0 Tbytes');
SELECT * FROM Computer;

SELECT * FROM Computer WHERE Make = 'HP';
SELECT * FROM Computer WHERE Make = 'Dell';
SELECT * FROM Computer;

ALTER TABLE Computer ADD Graphics TEXT(40);
SELECT * FROM Computer;

UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '6541001';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '6541002';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '6541003';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '6541004';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '6541005';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '6541006';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '9871234';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '9871245';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '9871256';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '9871267';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '9871278';
UPDATE Computer SET Graphics = 'Integrated Intel HD Graphics 4600' WHERE SerialNumber = '9871289';
SELECT * FROM Computer;

ALTER TABLE Computer DROP COLUMN ProcessorSpeed;
SELECT * FROM Computer;