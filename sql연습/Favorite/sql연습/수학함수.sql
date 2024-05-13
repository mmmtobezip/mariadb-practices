-- 
-- 수학 함수
--

-- abs(절대값)
select abs(1), abs(-1)
from dual;

-- ceil(반올림, 실수보다 큰 정수값) 
select ceil(3.14), ceiling(3.14)
from dual;

-- floor(내림, ceil 반대, 가장 작은 정수값)
select floor(3.14)
from dual;

-- mod(나머지 연산)
select mod(10, 3), 10 % 3 
from dual;

-- round(x): x의 가장 근접한 정수
select round(1.498), round(1.5551) 
from dual;
 
-- round(x, d): x값 중에 소수점 d 자리에 가장 근접한 실수
select round(1.498, 1), round(1.498, 0)
from dual; 

-- power(x, y), pow(x, y): x의 y승 
select power(2, 10), pow(2, 10)
from dual;

-- sign(x): 양수면 1, 음수면 -1, 0이면 1 출력 
select sign(20), sign(-100), sign(0)
from dual;

-- greatest(x, y, ...) least(x, y, ...)
select greatest(10 , 40, 20, 50), least(10, 40, 20, 50)
from dual;
-- 아스키 코드로 문자열 비교도 가능 
select greatest('b', 'A', 'c', 'D'), least('b', 'A', 'c', 'D')
from dual;

select least('hello', 'hela', 'hell')
from dual;