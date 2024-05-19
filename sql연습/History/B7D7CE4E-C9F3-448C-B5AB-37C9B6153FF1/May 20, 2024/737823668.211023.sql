SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN dept_emp c ON b.emp_no = c.emp_no
JOIN (SELECT a.dept_no, AVG(b.salary) as '평균급여'
		FROM dept_emp a
		JOIN salaries b ON a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01' 
		AND b.to_date = '9999-01-01'
		GROUP BY a.dept_no) d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01'
AND c.to_date = '9999-01-01'
AND b.salary > d.평균급여;