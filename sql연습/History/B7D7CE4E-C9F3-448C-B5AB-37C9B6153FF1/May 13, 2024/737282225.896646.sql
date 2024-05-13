SELECT A.first_name, B.dept_name, 
FROM employees as A, departments as B
WHERE emp_no = '13250'
ORDER BY dept_name ASC;