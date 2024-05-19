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