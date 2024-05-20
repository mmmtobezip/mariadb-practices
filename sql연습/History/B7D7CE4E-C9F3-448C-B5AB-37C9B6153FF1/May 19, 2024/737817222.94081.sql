-- 문제4.
-- 현재 이 회사의 평균 연봉은 얼마입니까?
-- '현재' = where절 
SELECT AVG(salaries)
FROM salaries
WHERE to_date LIKE '9999-%';