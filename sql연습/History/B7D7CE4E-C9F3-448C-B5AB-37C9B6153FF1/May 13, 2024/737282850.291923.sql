-- 문제11
-- 사번이 13250(Zeydy)인 지원의 직책 변경 상황을 시간순으로 출력해보세요.
-- 직책 테이블에 zeydy 뽑고 dept_name by 최근순으로 직책 출력 departmentsdepartmentstitlesemp_nodepartments

SELECT *
FROM titles 
WHERE emp_no = '13250'
ORDER BY from_date;