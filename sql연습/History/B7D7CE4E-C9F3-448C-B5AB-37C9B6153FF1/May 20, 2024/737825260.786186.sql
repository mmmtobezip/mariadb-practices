-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.



SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name) AS name, c.title, b.salary
FROM employees a
JOIN salary b ON a.emp_no = b.emp_no
JOIN titles c ON b.emp_no = c.emp_no
JOIN dept_emp d ON c.emp_no = d.emp_no
JOIN(SELECT b.dept_no, AVG(a.salary) as avg_salary
		FROM salaries a
		JOIN dept_emp b ON a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01' AND b.to_date = '9999-01-01'
		GROUP BY b.dept_no 
		ORDER BY avg_salary DESC
		LIMIT 0, 1) e ON d.dept_no = e.dept_no
WHERE b.to_date = '9999-01-01'
AND c.to_date = '9999-01-01'
AND d.to_date = '9999-01-0-1'
ORDER BY b.salary;