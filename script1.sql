/*
USE master;

IF DB_ID (N'CasinoSlot') IS NOT NULL
DROP DATABASE CasinoSLot;

CREATE DATABASE CasinoSlot

SELECT name,size*1.0/128 AS [Size in MBs]
FROM sys.master_files
WHERE name = N'CasinoSlot'; 
*/

/*
use CasinoSlot

CREATE TABLE EMPLOYEE (
    EMP_ID INTEGER PRIMARY KEY,
    EMP_FNAME VARCHAR(35) NOT NULL,
    EMP_LNAME VARCHAR(35) NOT NULL,
	EMP_GENDER VARCHAR(2) NOT NULL,
    EMP_ADDRESS VARCHAR(40) NOT NULL,
	EMP_EMAIL VARCHAR(40),
    EMP_DOB DATE NOT NULL,
    EMP_HIRE_DATE DATE NOT NULL,
    EMP_TERM_DATE DATE,
    EMP_DEPT_START_DATE DATE NOT NULL,
    EMP_LOCKER INTEGER,
    EMP_PAY_RATE DECIMAL(7,2) NOT NULL,
    EMP_VAC_ENTITLEMENT SMALLINT NOT NULL,
    EMP_SICK_ENTITLEMENT SMALLINT NOT NULL,
    DEPT_ID INT,
    ROLE_ID INT
);
CREATE TABLE DEPARTMENT (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(20) NOT NULL,
    DEPT_HEAD INT
);
CREATE TABLE DEPT_HISTORY (
    EMP_ID INT,
    DEPT_ID INT,
    ROLE_ID INT,
    HIST_START_DATE DATE NOT NULL,
    HIST_END_DATE DATE NOT NULL,
    PRIMARY KEY (EMP_ID, DEPT_ID, ROLE_ID)
);
CREATE TABLE EMPLOYEE_ROLE (
    ROLE_ID INT PRIMARY KEY,
    ROLE_TITLE VARCHAR(20) NOT NULL,
    ROLE_DESC VARCHAR(25) NOT NULL,
    DEPT_ID INT
);
CREATE TABLE ROLE_CERTIFICATION (
    ROLE_ID INT,
    CERTIFICATION_ID INT,
    PRIMARY KEY (ROLE_ID, CERTIFICATION_ID)
);
CREATE TABLE CERTIFICATION (
    CERTIFICATION_ID INT PRIMARY KEY,
    CERT_NAME VARCHAR(25) NOT NULL,
    CERT_VALID_FOR DATE NOT NULL,
    CERT_ISSUED_BY VARCHAR(25) NOT NULL
);
CREATE TABLE TRAINING_SESSION (
    SESSION_ID INT PRIMARY KEY,
    SESSION_DATE DATE NOT NULL,
    CERTIFICATION_ID INT NOT NULL,
    SKILL_ID INT
);
CREATE TABLE TRAINER_ATTENDANCE (
    EMP_ID INT,
    SESSION_ID INT,
    ATTEN_STATUS VARCHAR(25) NOT NULL,
    PRIMARY KEY (EMP_ID, SESSION_ID)
);
CREATE TABLE TRAINEE_ATTENDANCE (
    EMP_ID INT,
    SESSION_ID INT,
    ATTEN_STATUS VARCHAR(25) NOT NULL,
    PRIMARY KEY (EMP_ID, SESSION_ID)
);
CREATE TABLE SKILL (
    SKILL_ID INT PRIMARY KEY,
    SKILL_NAME VARCHAR(25) NOT NULL
);
CREATE TABLE SECTION_SKILL (
    SKILL_ID INT,
    SEC_ID INT,
    PRIMARY KEY (SKILL_ID, SEC_ID)
);
CREATE TABLE FLOOR_SECTION (
    SEC_ID INT PRIMARY KEY,
    SEC_NAME VARCHAR(25) NOT NULL
);
CREATE TABLE S_SHIFT (
    SHIFT_ID INT PRIMARY KEY,
    SHIFT_START SMALLDATETIME NOT NULL,
    SHIFT_END SMALLDATETIME NOT NULL,
    EMP_ID INT,
    SEC_ID INT,
    SCH_ID INT
);
CREATE TABLE SHIFT_INVENTORY (
    SHIFT_ID INT,
    INV_ID INT,
    QUANTITY INT NOT NULL,
    ASSIGN_DATE DATE NOT NULL,
    ASSIGN_STATUS VARCHAR(25) NOT NULL,
    EXP_DATE DATE,
    PRIMARY KEY (SHIFT_ID, INV_ID)
);
CREATE TABLE INVENTORY (
    INV_ID INT PRIMARY KEY,
    INV_TITLE VARCHAR(25) NOT NULL,
    INV_PRICE DECIMAL(9,2) NOT NULL,
    INV_QTY INT NOT NULL
);
CREATE TABLE LEAVE (
    LEAVE_ID INT PRIMARY KEY,
    LEAVE_TYPE VARCHAR(25) NOT NULL,
    LEAVE_START DATE NOT NULL,
    LEAVE_END DATE NOT NULL,
    LEAVE_COMMENT VARCHAR(255),
    EMP_ID INT
);
CREATE TABLE WRITTEN_WARNING (
    WW_ID INT PRIMARY KEY,
    WW_DATE DATE NOT NULL,
    WW_OFFENCE VARCHAR(25) NOT NULL,
    WW_LEVEL SMALLINT NOT NULL,
    WW_COMMENTS VARCHAR(255),
    EMP_ID INT NOT NULL
);
CREATE TABLE SCHEDULE(
SCH_ID INT PRIMARY KEY,
SCH_DATE DATE NOT NULL,
EMP_ID INT);

*/
/*
use CasinoSlot
-- Add foreign key constraints
ALTER TABLE Employee
ADD FOREIGN KEY (DEPT_ID) REFERENCES Department(DEPT_ID);
ALTER TABLE Employee
ADD FOREIGN KEY (ROLE_ID) REFERENCES EMPLOYEE_ROLE(ROLE_ID);

ALTER TABLE Department
ADD FOREIGN KEY (DEPT_HEAD) REFERENCES EMPLOYEE(EMP_ID);

ALTER TABLE DEPT_HISTORY
ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);
ALTER TABLE DEPT_HISTORY
ADD FOREIGN KEY (DEPT_ID) REFERENCES Department(DEPT_ID);
ALTER TABLE DEPT_HISTORY
ADD FOREIGN KEY (ROLE_ID) REFERENCES EMPLOYEE_ROLE(ROLE_ID);

ALTER TABLE EMPLOYEE_ROLE
ADD FOREIGN KEY (DEPT_ID) REFERENCES Department(DEPT_ID);

ALTER TABLE ROLE_CERTIFICATION
ADD FOREIGN KEY (ROLE_ID) REFERENCES EMPLOYEE_ROLE(ROLE_ID);
ALTER TABLE ROLE_CERTIFICATION
ADD FOREIGN KEY (CERTIFICATION_ID) REFERENCES CERTIFICATION(CERTIFICATION_ID);

ALTER TABLE TRAINING_SESSION
ADD FOREIGN KEY (CERTIFICATION_ID) REFERENCES CERTIFICATION(CERTIFICATION_ID);
ALTER TABLE TRAINING_SESSION
ADD FOREIGN KEY (SKILL_ID) REFERENCES SKILL(SKILL_ID);

ALTER TABLE TRAINER_ATTENDANCE
ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);
ALTER TABLE TRAINER_ATTENDANCE
ADD FOREIGN KEY (SESSION_ID) REFERENCES TRAINING_SESSION(SESSION_ID);

ALTER TABLE TRAINEE_ATTENDANCE
ADD FOREIGN KEY (EMP_ID) REFERENCES Employee(EMP_ID);
ALTER TABLE TRAINEE_ATTENDANCE
ADD FOREIGN KEY (SESSION_ID) REFERENCES TRAINING_SESSION(SESSION_ID);

ALTER TABLE SECTION_SKILL
ADD FOREIGN KEY (SKILL_ID) REFERENCES SKILL(SKILL_ID);
ALTER TABLE SECTION_SKILL
ADD FOREIGN KEY (SEC_ID) REFERENCES FLOOR_SECTION(SEC_ID);

ALTER TABLE S_SHIFT
ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);
ALTER TABLE S_SHIFT
ADD FOREIGN KEY (SEC_ID) REFERENCES FLOOR_SECTION(SEC_ID);
ALTER TABLE S_SHIFT
ADD FOREIGN KEY (SCH_ID) REFERENCES SCHEDULE(SCH_ID); -- Assuming there's a table named S_SCHEDULE with a primary key SCH_ID

ALTER TABLE SHIFT_INVENTORY
ADD FOREIGN KEY (SHIFT_ID) REFERENCES S_SHIFT(SHIFT_ID);
ALTER TABLE SHIFT_INVENTORY
ADD FOREIGN KEY (INV_ID) REFERENCES INVENTORY(INV_ID);

ALTER TABLE LEAVE
ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);

ALTER TABLE WRITTEN_WARNING
ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);

ALTER TABLE SCHEDULE
ADD FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID);
*/

use CasinoSlot
/*
INSERT INTO Department(DEPT_ID,DEPT_NAME,DEPT_HEAD)
VALUES(1,'SLOT', NULL);
INSERT INTO Department(DEPT_ID,DEPT_NAME,DEPT_HEAD)
VALUES(2,'HR', NULL);

INSERT INTO EMPLOYEE_ROLE(ROLE_ID, ROLE_TITLE, ROLE_DESC, DEPT_ID)
VALUES(1,'Shift Manager','Manages shifts',1);
INSERT INTO EMPLOYEE_ROLE(ROLE_ID, ROLE_TITLE, ROLE_DESC, DEPT_ID)
VALUES(2,'FLoor Supervisor','Manages floor',1);
INSERT INTO EMPLOYEE_ROLE(ROLE_ID, ROLE_TITLE, ROLE_DESC, DEPT_ID)
VALUES(3,'Director','Operations',1);
INSERT INTO EMPLOYEE_ROLE(ROLE_ID, ROLE_TITLE, ROLE_DESC, DEPT_ID)
VALUES(4,'Slot attendace','Guest management',1);
INSERT INTO EMPLOYEE_ROLE(ROLE_ID, ROLE_TITLE, ROLE_DESC, DEPT_ID)
VALUES(5,'Human Resources','Record keeping',2); 


INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (1, 'Emily', 'Johnson', 'F','123 Apple St', 'Johnson@gmail.com','2002-04-18', '2021-02-22', NULL, '2021-02-22', 1, 22.3, 9, 4, 2, 5);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (2, 'Olivia', 'Smith','F', '938 Pear St', 'Oli@gmail.com', '1967-12-18', '2022-09-21', NULL, '2022-09-21', 2, 17.3, 5, 8, 1, 1);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (3, 'Sophia', 'Martinez','F', '432 Peach St', 'Sophia@gmail.com', '1989-05-13', '2007-06-12', NULL, '2007-06-12', 3, 19.3, 3, 2, 1, 2);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (4, 'Ava', 'Thompson','F', '765 Plum St', 'Ava@gmail.com', '2001-09-04', '2017-05-23', NULL, '2017-05-23', 4, 13.3, 7, 2, 1, 3);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (5, 'Isabella', 'Anderson','F', '489 Orange St', 'Isa@gmail.com', '2000-03-04', '2018-05-21', NULL, '2018-05-21', 5, 17.99, 2, 2, 1, 4);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (6, 'James', 'Brown','M', '489 Blue St', 'james@gmail.com', '2003-02-14', '2022-01-21', NULL, '2022-01-21', 6, 17.99, 2, 2, 1, 4);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (7, 'Liam', 'William','M', '489 Purple St', 'liam@gmail.com', '1978-03-04', '2018-06-21', NULL, '2018-06-21', 7, 17.99, 2, 2, 1, 4);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (8, 'Noah', 'Garcia', 'M','489 Yeloow St', 'noah@gmail.com', '2006-03-04', '2022-07-21', NULL, '2022-07-21', 8, 17.99, 2, 2, 1, 4);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (9, 'Ethan', 'Taylor', 'M','489 Green St', 'ethan@gmail.com', '1989-03-04', '2019-02-21', NULL, '2019-02-21', 9, 17.99, 2, 2, 1, 4);

INSERT INTO EMPLOYEE(EMP_ID, EMP_FNAME, EMP_LNAME, EMP_GENDER,EMP_ADDRESS, EMP_EMAIL,
EMP_DOB, EMP_HIRE_DATE, EMP_TERM_DATE, EMP_DEPT_START_DATE, EMP_LOCKER, EMP_PAY_RATE, EMP_VAC_ENTITLEMENT, EMP_SICK_ENTITLEMENT, DEPT_ID, ROLE_ID)
VALUES (10, 'Benjamin', 'Wilson', 'M','489 Yellow St', 'ben@gmail.com', '2004-03-04', '2021-05-21', NULL, '2021-05-21', 10, 17.99, 2, 2, 1, 4);




INSERT INTO DEPT_HISTORY(EMP_ID,DEPT_ID,ROLE_ID,HIST_START_DATE,HIST_END_DATE)
VALUES(1,2,5,'2021-02-22','2028-03-22'),
(2,1,1,'2022-09-21','2028-03-22'),
(3,1,2,'2007-06-12','2028-03-22'),
(4,1,3,'2017-05-23','2028-03-22'),
(5,1,4,'2018-05-21', '2028-03-22'),
(6,1,4, '2021-05-21', '2028-03-22'),
(7,1,4, '2018-06-21','2028-03-22'),
(8,1,4, '2022-07-21', '2028-03-22'),
(9,1,4, '2019-02-21', '2028-03-22'),
(10,1,4, '2004-03-04', '2028-03-22');

*/

use CasinoSlot
INSERT INTO CERTIFICATION(CERTIFICATION_ID,CERT_NAME,CERT_VALID_FOR,CERT_ISSUED_BY)
VALUES(1,'HUMAN RESOURCES','2026-09-12','AVA'),
(2,'MANAGEMENT','2026-09-12','AVA'),
(3,'SUPERVISING','2023-05-06','AVA'),
(4,'OPERATIONS','2023-05-05','AVA'),
(5,'SLOT','2024-05-05','AVA'),
(6,'SLOT','2028-05-05','AVA'),
(7,'SLOT','2023-04-05','AVA'),
(8,'SLOT','2027-05-05','AVA'),
(9,'SLOT','2034-05-05','AVA'),
(10,'SLOT','2024-05-05','AVA');

use CasinoSlot
INSERT INTO ROLE_CERTIFICATION(ROLE_ID,CERTIFICATION_ID)
VALUES(5,1),
(1,2),
(2,3),
(3,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10);
/*
INSERT INTO SKILL(SKILL_ID,SKILL_NAME)
VALUES(5,'RESOURCES'),
(1,'MANAGING'),
(2,'SUPERVISING'),
(3,'OPERTAING'),
(4,'CUSTOMER SERVICE');

INSERT INTO TRAINING_SESSION(SESSION_ID,SESSION_DATE,CERTIFICATION_ID,SKILL_ID)
VALUES(1,'2022-03-12',1,5),
(2,'2022-03-12',2,1),
(3,'2022-03-12',3,2),
(4,'2022-03-12',4,3),
(5,'2022-03-12',5,4),
(6,'2022-03-12',6,4),
(7,'2022-03-12',7,4),
(8,'2022-03-12',8,4),
(9,'2022-03-12',9,4),
(10,'2022-03-12',10,4);



INSERT INTO TRAINER_ATTENDANCE(EMP_ID,SESSION_ID,ATTEN_STATUS)
VALUES(1,1,'YES'),
(1,2,'YES'),
(1,3,'YES'),
(1,4,'YES'),
(1,5,'YES'),
(1,6,'YES'),
(1,7,'YES'),
(1,8,'YES'),
(1,9,'YES'),
(1,10,'YES');



INSERT INTO TRAINEE_ATTENDANCE(EMP_ID,SESSION_ID,ATTEN_STATUS)
VALUES(2,2,'YES'),
(3,2,'YES'),
(4,2,'YES'),
(5,2,'YES'),
(6,2,'YES'),
(7,2,'YES'),
(8,2,'YES'),
(9,2,'YES'),
(10,2,'YES');


INSERT INTO WRITTEN_WARNING(WW_ID,WW_DATE,WW_OFFENCE,WW_LEVEL,WW_COMMENTS,EMP_ID)
VALUES(1,'2021-01-03','On phone during shift.',1,'issue discussed', 6),
(2,'2022-01-01','On phone during shift.',2,'issue discussed',6),
(3,'2022-05-01','used slot machine',2,'issue discussed',8),
(4,'2022-07-01','yelled at customer',2,'issue discussed',9),
(5,'2012-04-01','On phone during shift.',2,'issue discussed',10);

INSERT INTO LEAVE(LEAVE_ID,LEAVE_TYPE,LEAVE_START,LEAVE_END,LEAVE_COMMENT,EMP_ID)
VALUES(1,'s','2023-01-01','2023-01-02',NULL,6),
(2,'v','2023-02-01','2023-01-02',NULL,6),
(3,'s','2023-01-01','2023-01-01',NULL,5),
(4,'s','2023-01-05','2023-01-05',NULL,5),
(5,'v','2023-03-11','2023-03-14',NULL,1),
(6,'s','2023-03-23','2023-03-26',NULL,1),
(7,'s','2023-03-23','2023-03-24',NULL,3),
(8,'v','2023-04-23','2023-04-25',NULL,3),
(9,'v','2023-06-23','2023-03-24',NULL,2),
(10,'s','2023-03-23','2023-03-24',NULL,9);
*/
