SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), d.manager, c.dept_name
FROM employees a
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN (SELECT a.dept_no, b.first_name AS manager
		FROM dept_manager a
		JOIN employees b on a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01') d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01';