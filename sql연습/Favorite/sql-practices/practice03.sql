-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM employees a, salaries b
WHERE a.emp_no = b.emp_no
AND b.to_date = '9999-01-01'
ORDER BY b.salary DESC;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.title
FROM employees a, titles b
WHERE a.emp_no = b.emp_no
AND b.to_date LIKE '9999-%';

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요.
SELECT a.emp_no as '사번', CONCAT(a.first_name, ' ', a.last_name) as '이름', b.dept_name as '부서'
FROM employees a, departments b, dept_emp c
WHERE a.emp_no = c.emp_no
AND b.dept_no = c.dept_no
AND c.to_date LIKE '9999%'
ORDER BY 이름 ASC;

-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
SELECT a.emp_no AS '사번', CONCAT(a.first_name, ' ', a.last_name) AS '이름', d.salary AS '연봉', e.title AS '직책', c.dept_name AS '부서'
FROM employees a, dept_emp b, departments c, salaries d, titles e
WHERE a.emp_no = b.emp_no
AND a.emp_no = d.emp_no
AND a.emp_no = e.emp_no
AND b.dept_no = c.dept_no
AND b.to_date LIKE '9999%'
AND d.to_date LIKE '9999%'
AND e.to_date LIKE '9999%'
ORDER BY 이름 ASC;

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요.
-- (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 
-- 이름은 first_name과 last_name을 합쳐 출력 합니다.
SELECT a.emp_no AS '사번', CONCAT(a.first_name, ' ', a.last_name) AS '이름'
FROM employees a, titles b
WHERE a.emp_no = b.emp_no
AND b.title = 'Technique Leader' 
AND b.to_date NOT LIKE '9999%';

-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
SELECT CONCAT(a.first_name, ' ', a.last_name) AS '이름', c.dept_name AS '부서명', d.title AS '직책'
FROM employees a, dept_emp b, departments c, titles d
WHERE a.emp_no = b.emp_no
AND a.emp_no = d.emp_no
AND b.dept_no = c.dept_no
AND a.last_name LIKE 'S%';

-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
SELECT a.emp_no AS '사번', a.salary AS '급여'
FROM salaries a, titles b 
WHERE a.emp_no = b.emp_no
AND b.title = 'Engineer' 
AND a.salary >= 40000
AND a.to_date = '9999-01-01'
AND b.to_date = '9999-01-01'
ORDER BY 급여 DESC;

-- 문제8.
-- 현재 평균급여가 50000이 넘는 직책을 직책, 평균급여로 평균급여 큰 순서대로 출력하시오
-- order by 평균급여
SELECT b.title AS '직책', AVG(a.salary) as '평균급여'
FROM salaries a, titles b 
WHERE a.emp_no = b.emp_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY 직책
HAVING 평균급여 >= 50000
ORDER BY 평균급여 DESC;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
SELECT a.dept_name as '부서명', AVG(c.salary) AS '평균연봉'
FROM departments a 
JOIN dept_emp b ON a.dept_no = b.dept_no
JOIN salaries c ON b.emp_no = c.emp_no
WHERE b.to_date LIKE '9999%'
AND c.to_date LIKE '9999%'
GROUP BY 부서명
ORDER BY 평균연봉 DESC;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
SELECT a.title AS '직책', AVG(b.salary) as '평균연봉'
FROM titles a
JOIN salaries b ON a.emp_no = b.emp_no
WHERE a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY 직책
ORDER BY 평균연봉 DESC;