-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
SELECT CONCAT(a.first_name, ' ', a.last_name) AS '이름', c.dept_name AS '부서명', d.title AS '직책'
FROM employees a, dept_emp b, departments c, titles d
WHERE a.emp_no = b.emp_no
AND a.emp_no = d.emp_no
AND b.dept_no = c.dept_no
AND a.last_name LIKE 'S%';