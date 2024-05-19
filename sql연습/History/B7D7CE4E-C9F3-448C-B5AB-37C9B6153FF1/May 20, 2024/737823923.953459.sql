-- 문제4.
-- 현재, 사원들의 사번, 이름, 자신의 매니저 이름, 부서 이름으로 출력해 보세요.
-- department + dept_emp + employees = 사원
-- dept_manage + employees = 매니저 
-- 사원의 dept_emp의 dept_no랑 dept_manager의 dept_no가 같은게 내 매니저
SELECT
FROM employees a
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN (SELECT
		FROM dept_manager a
		JOIN employees b on a.emp_no = b.emp_no
		WHERE a.to_date = '9999-01-01') d ON c.dept_no = d.dept_no
WHERE b.to_date = '9999-01-01';