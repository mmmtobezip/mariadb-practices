SELECT b.title AS '직책', ROUND(AVG(a.salary)) AS '평균연봉'
FROM salaries a, titles b
WHERE a.emp_no = b.emp_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY b.title
ORDER BY 평균연봉 DESC
LIMIT 1;