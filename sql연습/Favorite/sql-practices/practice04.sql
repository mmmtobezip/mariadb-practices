-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
SELECT COUNT(*)
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
WHERE b.to_date LIKE '9999%'
AND b.salary > (SELECT AVG(salary)
					FROM salaries
					WHERE to_date LIKE '9999%');

-- 문제2. (x)
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서명, 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
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

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요.
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN dept_emp c ON b.emp_no = c.emp_no
JOIN (SELECT a.dept_no, AVG(b.salary) as avg_salary
		FROM dept_emp a
		JOIN salaries b ON a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01' 
		AND b.to_date = '9999-01-01'
		GROUP BY a.dept_no) d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01'
AND c.to_date = '9999-01-01'
AND b.salary > d.avg_salary;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 자신의 매니저 이름, 부서 이름으로 출력해 보세요.
-- department + dept_emp + employees = 사원
-- dept_manage + employees = 매니저 
-- 사원의 dept_emp의 dept_no랑 dept_manager의 dept_no가 같은게 내 매니저
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name) AS name, d.manager, c.dept_name
FROM employees a
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN (SELECT a.dept_no, b.first_name AS manager
		FROM dept_manager a
		JOIN employees b on a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01') d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01';

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), c.title, b.salary
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN titles c ON a.emp_no = c.emp_no
JOIN dept_emp d ON a.emp_no = d.emp_no
JOIN(SELECT b.dept_no, AVG(a.salary) as avg_salary
		FROM salaries a
		JOIN dept_emp b ON a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01' AND b.to_date = '9999-01-01'
		GROUP BY b.dept_no 
		ORDER BY avg_salary DESC
		LIMIT 1) e ON d.dept_no = e.dept_no
WHERE b.to_date = '9999-01-01'
AND c.to_date = '9999-01-01'
AND d.to_date = '9999-01-01'
ORDER BY b.salary;

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
SELECT c.dept_name AS '부서명', ROUND(AVG(a.salary)) AS '평균연봉'
FROM salaries a, dept_emp b, departments c
WHERE a.emp_no = b.emp_no
AND b.dept_no = c.dept_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY b.dept_no
ORDER BY 평균연봉 DESC
LIMIT 0, 1;

-- 문제7.
-- 평균 연봉이 가장 높은 직책?
SELECT b.title AS '직책', ROUND(AVG(a.salary)) AS '평균연봉'
FROM salaries a, titles b
WHERE a.emp_no = b.emp_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY b.title
ORDER BY 평균연봉 DESC
LIMIT 1;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
SELECT d.dept_name AS '부서이름', CONCAT(a.first_name, ' ', a.last_name) AS '사원이름', b.salary AS '연봉', e.manager AS '매니저 이름', e.manager_salary AS '매니저 연봉'
FROM employees a
JOIN salaries b ON a.emp_no = b.emp_no
JOIN dept_emp c ON a.emp_no = c.emp_no
JOIN departments d ON c.dept_no = d.dept_no
JOIN(SELECT a.dept_no, b.first_name AS manager, c.salary as manager_salary 
		FROM dept_manager a
		JOIN employees b on a.emp_no = b.emp_no
		JOIN salaries c ON c.emp_no = a.emp_no
		WHERE a.to_date = '9999-01-01'
		AND c.to_date = '9999-01-01') e ON d.dept_no = e.dept_no
WHERE b.to_date = '9999-01-01'
AND c.to_date = '9999-01-01'
AND b.salary > e.manager_salary
ORDER BY 연봉;