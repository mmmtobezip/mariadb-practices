SELECT
	e.emp_no,
	concat(e.first_name, ' ', e.last_name),
	m.manager,
	d.dept_name
FROM
	dept_emp de,
	employees e,
	departments d,
	(
		SELECT
			dm.dept_no,
			concat(e.first_name, ' ', e.last_name) AS manager
		FROM
			dept_manager dm,
			employees e
		WHERE
			dm.emp_no = e.emp_no
			AND dm.to_date LIKE '9999%') m
WHERE
	e.emp_no = de.emp_no
	AND d.dept_no = de.dept_no
	AND m.dept_no = de.dept_no
	AND de.to_date LIKE '9999%';