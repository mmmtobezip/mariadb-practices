-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
SELECT a.dept_name as '부서명', AVG(c.salary) AS '평균급여'
FROM departments a 
JOIN dept_emp b ON a.dept_no = b.dept_no
JOIN salaries c ON b.emp_no = c.emp_no
WHERE b.to_date LIKE '9999%'
AND c.to_date LIKE '9999%'
GROUP BY 부서명
ORDER BY 평균급여 DESC;