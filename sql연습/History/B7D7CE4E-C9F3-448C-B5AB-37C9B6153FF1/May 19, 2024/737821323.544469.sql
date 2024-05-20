SELECT a.emp_no AS '사번', CONCAT(a.first_name, ' ', a.last_name) AS '이름'
FROM employees a, titles b
WHERE a.emp_no = b.emp_no
AND b.title = 'Technique Leader' 
AND b.to_date NOT LIKE '9999%';