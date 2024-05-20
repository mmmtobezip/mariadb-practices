-- 문제3.
-- 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
-- employees tables에서 추출, not group by  
SELECT DATE_FORMAT(MIN(hire_date), '%Y년 %m월 %d일')
FROM employees;