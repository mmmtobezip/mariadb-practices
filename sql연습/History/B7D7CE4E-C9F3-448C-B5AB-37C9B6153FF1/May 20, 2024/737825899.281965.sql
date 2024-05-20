SELECT
	d.dept_name,
	round(avg(s.salary))
FROM
	salaries s,
	dept_emp de,
	departments d
WHERE
	s.emp_no = de.emp_no
	AND de.dept_no = d.dept_no
	AND s.to_date LIKE '9999%'
GROUP BY
	de.dept_no
ORDER BY
	round(avg(s.salary))
	DESC
LIMIT 1;