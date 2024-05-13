-- 문제8.
-- 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
-- salary tables, count 
SELECT count(emp_no)
FROM salaries
WHERE salary >= '120000';