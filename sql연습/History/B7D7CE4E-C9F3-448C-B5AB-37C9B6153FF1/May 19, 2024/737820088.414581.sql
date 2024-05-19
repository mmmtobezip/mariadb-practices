-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name), b.title
FROM employees a, titles b
WHERE a.emp_no = b.emp_no
AND b.to_date LIKE '9999%';