/*USE master;

IF DB_ID (N'Casino') IS NOT NULL
DROP DATABASE Casino;

CREATE DATABASE Casino

SELECT name,size*1.0/128 AS [Size in MBs]
FROM sys.master_files
WHERE name = N'Casino'; */
USE Casino;

CREATE TABLE Employee (
EMP_ID INTEGER PRIMARY KEY,
EMP_FNAME VARCHAR(35),
EMP_LNAME VARCHAR(35),
EMP_ADDRESS VARCHAR(40),
EMP_DOB DATE,
EMP_HIRE_DATE DATE,
EMP_TERM_DATE DATE,
EMP_DEPT_START_DATE DATE,
EMP_LOCKER INTEGER,
EMP_PAY_RATE DECIMAL(7,2),
EMP_VAC_ENTITLEMENT SMALLINT,
EMP_SICK_ENTITLEMENT SMALLINT,
DEPT_ID INT,
ROLE_ID INT,
);
