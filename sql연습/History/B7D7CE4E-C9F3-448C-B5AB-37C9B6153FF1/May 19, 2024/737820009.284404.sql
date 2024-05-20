-- 테이블간 조인(JOIN) SQL 문제입니다.

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.salary
FROM employees a, salaries b
WHERE a.emp_no = b.emp_no
AND b.to_date = '9999-01-01'
ORDER BY b.salary DESC;