-- 문제2.
-- 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
-- dateformat 사용 
SELECT DATE_FORMAT(MAX(hire_date), '%Y년 %m월 %d일')
FROM employees;