SELECT COUNT(*)
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
WHERE b.to_date LIKE '9999%'
AND b.salary > (SELECT AVG(salary)
					FROM salaries
					WHERE to_date LIKE '9999%');