SELECT a.emp_no AS '사번', a.salary AS '급여'
FROM salaries a, titles b 
WHERE a.emp_no = b.emp_no
AND b.title = 'Engineer' 
AND a.to_date = '9999-01-01'
AND b.to_date = '9999-01-01'
AND a.salary >= 40000
ORDER BY 급여 DESC;