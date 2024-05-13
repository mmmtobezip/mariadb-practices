-- 문제11
-- 사번이 13250(Zeydy)인 지원의 직책 변경 상황을 시간순으로 출력해보세요.
-- 직책 테이블에 zeydy 뽑고 dept_name by 최근순으로 직책 출력 departmentsdepartmentstitlesemp_nodepartments

SELECT A.first_name, B.dept_name, C.from_date
FROM employees as A, departments as B, dept_emp as C
WHERE emp_no = '13250'
ORDER BY dept_name ASC;