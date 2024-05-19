SELECT
	d.dept_name,
	concat(e.first_name, ' ', e.last_name) AS name,
	s.salary,
	m.manager,
	m.salary AS manager_salary
FROM
	departments d,
	employees e,
	salaries s,
	dept_emp de,
	(
		SELECT
			dm.dept_no,
			concat(e.first_name, ' ', e.last_name) AS manager,
			s.salary
		FROM
			dept_manager dm,
			employees e,
			salaries s
		WHERE
			dm.emp_no = e.emp_no
			AND e.emp_no = s.emp_no
			AND dm.to_date LIKE '9999%'
			AND s.to_date LIKE '9999%') m
WHERE
	d.dept_no = de.dept_no
	AND e.emp_no = de.emp_no
	AND e.emp_no = s.emp_no
	AND d.dept_no = m.dept_no
	AND de.to_date LIKE '9999%'
	AND s.to_date LIKE '9999%'
	AND s.salary > m.salary;