-- Script 2, queries.



-- 1: Number of hours each employee worked per week?


-- 2:Number of labor hours last week?


-- 3: List of which employees worked breaker shifts in the last month?


-- 4: How many breaker shifts are scheduled this week?


-- 5: How many Slot Attendants are scheduled today?


-- 6: Any Slot Attendants who have not been assigned to Section NORTH in the last month


-- 7: Number of active Written Warning (WW) employee A has?


-- 8: List of active WW sorted by date and employee


-- 9: A list of an employee's discipline/performance actions


-- 10: Number of sick days an employee has available? Brendan WIP
WITH used_sick_days AS (
  SELECT
    EMP_ID,
    COALESCE(SUM(JULIANDAY(LEAVE_END) - JULIANDAY(LEAVE_START)) + 1, 0) AS used_days
  FROM
    LEAVE
  WHERE
    LEAVE_TYPE = 'Sick'
  GROUP BY
    EMP_ID
)
SELECT
  e.EMP_ID,
  e.EMP_FNAME,
  e.EMP_LNAME,
  e.EMP_SICK_ENTITLEMENT - IFNULL(usd.used_days, 0) AS available_sick_days
FROM
  EMPLOYEE e
  LEFT JOIN used_sick_days usd ON e.EMP_ID = usd.EMP_ID
WHERE
  e.EMP_ID = :employee_id;



-- 11: Number of vacation days an employee has available


-- 12: Statistics on Employees: Number of Female/Male employees, Average age of employees? Number of employees over 50? Under 30? teddy
-- ADD EMP_GENDER COLUMN TO EMPLOYEE
select count(case when EMP_GENDER = 'F' then 1 end) as NumberOfFemales, 
	   count(case when EMP_GENDER = 'M' then 1 end) as NumberOfMales,
	   avg(datediff(year, emp_dob, getdate())) as 'AVG AGE', 
	   count(case when datediff(year, emp_dob, getdate()) > 50 then 1 end) as 'A > 50', 
	   count(case when datediff(year, emp_dob, getdate()) < 30 then 1 end) as 'A < 30' 
	   from Employee;


-- 13: List of employees who has the mandatory certification expiring in the next 6 weeks? teddy


-- 14: List of employees who need updated in-house training


-- 15: List of employees who have expired training? teddy


-- 16: How many uniforms remain un-allocated?



