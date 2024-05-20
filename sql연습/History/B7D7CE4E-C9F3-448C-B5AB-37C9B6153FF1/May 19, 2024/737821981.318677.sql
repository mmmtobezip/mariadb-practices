SELECT b.title AS '직책', AVG(a.salary) as '평균급여'
FROM salaries a, titles b 
WHERE a.emp_no = b.emp_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY 직책
HAVING 평균급여 >= 50000
ORDER BY 평균급여 DESC;