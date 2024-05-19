-- 문제2. (x)
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), d.dept_name, b.salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN dept_emp c ON b.emp_no = c.emp_no
JOIN departments d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01' 
AND c.to_date = '9999-01-01'
AND (c.dept_no, b.salary) IN (SELECT b.dept_no, MAX(a.salary)
									FROM salaries a, dept_emp b
									WHERE a.emp_no = b.emp_no
									AND a.to_date = '9999-01-01' 
									AND b.to_date = '9999-01-01'
									GROUP BY b.dept_no)
ORDER BY b.salary DESC;