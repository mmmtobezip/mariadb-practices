SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), c.title, b.salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN titles c ON a.emp_no = c.emp_no
JOIN dept_emp d ON a.emp_no = d.emp_no
JOIN(SELECT b.dept_no, AVG(a.salary) as avg_salary
		FROM salaries a
		JOIN dept_emp b ON a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01' AND b.to_date = '9999-01-01'
		GROUP BY b.dept_no 
		ORDER BY avg_salary DESC
		LIMIT 0, 1) e ON d.dept_no = e.dept_no
WHERE b.to_date = '9999-01-01'
AND c.to_date = '9999-01-01'
AND d.to_date = '9999-01-01'
ORDER BY b.salary;