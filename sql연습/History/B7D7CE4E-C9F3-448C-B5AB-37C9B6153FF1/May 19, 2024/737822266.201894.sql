-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
SELECT a.title AS '직책', AVG(b.salary) as '평균연봉'
FROM titles a
JOIN salaries b ON a.emp_no = b.emp_no
WHERE a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY 직책
ORDER BY 평균연봉 DESC;