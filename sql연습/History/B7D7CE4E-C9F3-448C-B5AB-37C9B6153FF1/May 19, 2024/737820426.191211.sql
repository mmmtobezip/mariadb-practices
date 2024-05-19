NAME

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요.
SELECT a.emp_no as '사번', CONCAT(a.first_name, ' ', a.last_name) as '이름', b.dept_name as '부서'
FROM employees a, departments b, dept_emp c
WHERE a.emp_no = c.emp_no
AND b.dept_no = c.dept_no
AND c.to_date LIKE '9999%'
ORDER BY 이름 ASC;