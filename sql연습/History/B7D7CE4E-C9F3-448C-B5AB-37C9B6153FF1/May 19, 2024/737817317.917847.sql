-- 문제5.
-- 현재 이 회사의 최고/최저 연봉은 얼마입니까?
SELECT MAX(salary) as '최고임금', MIN(salary) as '최저임금'
FROM salaries
WHERE to_date = '9999-01-01';