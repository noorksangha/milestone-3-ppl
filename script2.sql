-- Script 2, queries.



-- 1: Number of hours each employee worked per week? Brendan, creates the columns but doesnt get any values, not sure if query is broken or table doesnt have necessary data.
SELECT
    E.EMP_ID,
    E.EMP_FNAME,
    E.EMP_LNAME,
    YEAR(S.SCH_DATE) AS Year,
    DATEPART(WEEK, S.SCH_DATE) AS Week,
    SUM(DATEDIFF(MINUTE, SH.SHIFT_START, SH.SHIFT_END)) / 60.0 AS HoursWorked
FROM
    EMPLOYEE E
INNER JOIN
    SCHEDULE S
    ON E.EMP_ID = S.EMP_ID
INNER JOIN
    S_SHIFT SH
    ON S.SCH_ID = SH.SCH_ID
GROUP BY
    E.EMP_ID,
    E.EMP_FNAME,
    E.EMP_LNAME,
    YEAR(S.SCH_DATE),
    DATEPART(WEEK, S.SCH_DATE)
ORDER BY
    E.EMP_ID,
    Year,
    Week;


-- 2:Number of labor hours last week?


-- 3: List of which employees worked breaker shifts in the last month?


-- 4: How many breaker shifts are scheduled this week?


-- 5: How many Slot Attendants are scheduled today?


-- 6: Any Slot Attendants who have not been assigned to Section NORTH in the last month


-- 7: Number of active Written Warning (WW) employee A has?


-- 8: List of active WW sorted by date and employee


-- 9: A list of an employee's discipline/performance actions


-- 10: Number of sick days an employee has available? Brendan WIP
WITH SickLeaves AS (
    SELECT
        EMP_ID,
        SUM(DATEDIFF(day, LEAVE_END, LEAVE_START) + 1) AS SickDaysTaken
    FROM
        LEAVE
    WHERE
        LEAVE_TYPE = 'Sick'
    GROUP BY
        EMP_ID
)
SELECT
    E.EMP_ID,
    E.EMP_FNAME,
    E.EMP_LNAME,
    E.EMP_SICK_ENTITLEMENT - COALESCE(SL.SickDaysTaken, 0) AS AvailableSickDays
FROM
    EMPLOYEE E
LEFT JOIN
    SickLeaves SL
    ON E.EMP_ID = SL.EMP_ID;


-- 11: Number of vacation days an employee has available
WITH VacationLeaves AS (
    SELECT
        EMP_ID,
        SUM(DATEDIFF(day, LEAVE_END, LEAVE_START) + 1) AS VacationDaysTaken
    FROM
        LEAVE
    WHERE
        LEAVE_TYPE = 'Vacation'
    GROUP BY
        EMP_ID
)
SELECT
    E.EMP_ID,
    E.EMP_FNAME,
    E.EMP_LNAME,
    E.EMP_VAC_ENTITLEMENT - COALESCE(VL.VacationDaysTaken, 0) AS AvailableVacationDays
FROM
    EMPLOYEE E
LEFT JOIN
    VacationLeaves VL
    ON E.EMP_ID = VL.EMP_ID;


-- 12: Statistics on Employees: Number of Female/Male employees, Average age of employees? Number of employees over 50? Under 30? teddy
-- ADD EMP_GENDER COLUMN TO EMPLOYEE
select count(case when EMP_GENDER = 'F' then 1 end) as NumberOfFemales, 
	   count(case when EMP_GENDER = 'M' then 1 end) as NumberOfMales,
	   avg(datediff(year, emp_dob, getdate())) as 'AVG AGE', 
	   count(case when datediff(year, emp_dob, getdate()) > 50 then 1 end) as 'A > 50', 
	   count(case when datediff(year, emp_dob, getdate()) < 30 then 1 end) as 'A < 30' 
	   from Employee;


-- 13: List of employees who has the mandatory certification expiring in the next 6 weeks? teddy
select * from CERTIFICATION where DATEDIFF(week,getdate(), CERT_VALID_FOR) < 6;

-- 14: List of employees who need updated in-house training


-- 15: List of employees who have expired training? teddy
select * from CERTIFICATION where DATEDIFF(day, CERT_VALID_FOR, GETDATE()) > 0;

-- 16: How many uniforms remain un-allocated?



