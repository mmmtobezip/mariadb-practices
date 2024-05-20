SELECT
	e.emp_no,
	concat(e.first_name, ' ', e.last_name) AS name,
	t.title,
	s.salary
FROM
	dept_emp de,
	employees e,
	titles t,
	salaries s
WHERE
	de.emp_no = e.emp_no
	AND t.emp_no = e.emp_no
	AND e.emp_no = s.emp_no
	AND de.to_date LIKE '9999%'
	AND s.to_date LIKE '9999%'
	AND de.dept_no = (
		SELECT
			de.dept_no
		FROM
			dept_emp de,
			salaries s
		WHERE
			de.emp_no = s.emp_no
			AND de.to_date LIKE '9999%'
			AND s.to_date LIKE '9999%'
		GROUP BY
			de.dept_no
		ORDER BY
			avg(s.salary)
			DESC
		LIMIT 1)
ORDER BY
	s.salary ASC;