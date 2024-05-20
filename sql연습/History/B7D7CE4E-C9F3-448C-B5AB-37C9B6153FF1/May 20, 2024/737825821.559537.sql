-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
SELECT c.dept_name AS '부서명', ROUND(AVG(a.salary)) AS '평균연봉'
FROM salaries a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no
AND b.dept_no = c.dept_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY 부서명
ORDER BY 평균연봉 DESC
LIMIT 0, 1;