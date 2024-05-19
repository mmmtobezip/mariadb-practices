-- 문제8.
-- 현재 평균급여가 50000이 넘는 직책을 직책, 평균급여로 평균급여 큰 순서대로 출력하시오
-- order by 평균급여
SELECT b.title AS '직책', AVG(a.salary) as '평균급여'
FROM salaries a, titles b 
WHERE a.emp_no = b.emp_no
AND a.to_date LIKE '9999%'
AND b.to_date LIKE '9999%'
GROUP BY 직책
HAVING 평균급여 >= 50000
ORDER BY 평균급여 DESC;