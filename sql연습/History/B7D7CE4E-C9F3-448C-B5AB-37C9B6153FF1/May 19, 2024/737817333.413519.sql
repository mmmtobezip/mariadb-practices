SELECT MAX(salary) as '최고임금', MIN(salary) as '최저임금'
FROM salaries
WHERE to_date = '9999-01-01';