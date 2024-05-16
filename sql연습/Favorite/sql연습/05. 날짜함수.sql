--
-- 날짜 함수
--

-- curdate(), current_date
select curdate(), current_date from dual;

-- curdate(), current_time 
select curdate(), current_time from dual;

-- now() vs sysdate()
select now(), sysdate() from dual;
select now(), sleep(2), now() from dual; -- now() 쿼리 실행 전 전부 실행됨. 즉 쿼리가 실행된 시간 -> sleep() 이후 now()를 호출해도 시간이 같은 이유  
select now(), sleep(2), sysdate() from dual; -- sysdate()은 함수가 호출된 시간 

-- date_format
-- default format: %Y-%m-%d %h:%i:%s 
select date_formt(now(), '%Y년 %m월 %d일 %h시 %i분 %s초') from dual;
select date_format(now(), '%d %b \'%y %h:%i:%s') from dual;

-- period_diff
-- 예제1: 근무개월
select first_name,
		hire_date,
		period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) -- 큰 날짜 
from employees;
        
-- date_add(=adddate), date_sub(=subdate)
-- 날짜를 date 타입의 컬럼이나 값의 type(year, month, day)의 표현식으로 더하거나 뺄 수 있다. 
-- 예제2: 각 사원의 근속 연수가 5년이 되는 날에 휴가를 보내준다면 각 사원의 5년 근속 휴가 날짜는?
select first_name,
		hire_date,
        date_add(hire_date, interval 5 year)
from employees;