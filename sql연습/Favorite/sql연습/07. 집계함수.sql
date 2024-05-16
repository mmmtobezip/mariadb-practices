-- 1) 집계 쿼리: select 절에 통계함수(count, max, min, sum, avg, variance, stddev, ..)
select avg(salary), sum(salary)
from salaries;

-- 2) select 절에 집계함수(그룹함수)가 존재하는 경우, 어떤 컬럼도 select절에 올 수 없다. 
-- 	  아래 emp_no는 아무 의미가 없음 -> 오류 -> Oracle의 경우  
select emp_no, avg(salary)
from salaries;

-- 3) query 순서
-- 1. from: 접근 테이블 확인
-- 2. where: 조건에 맞는 row 선택(임시 테이블)
-- 3. 집계(결과 테이블)
-- 4. projection
-- 예제1: 사번이 10060인 사원이 받은 평균 월급 
select avg(salary) 
from salaries
where emp_no = '10060';

-- 집꼐함수로 묶인 컬럼은 select 절에 올 수 없지만, 예외로 group by로 묶은 컬럼은 select 절에 올 수 있음 -> 그룹핑하는 기준이 되는 컬럼이기에  
-- select 집계함수(c1),  c1
-- from t1
-- where cond
-- group by c1 
-- having cond

-- 4) group by에 참여하고 있는 컬럼은 projection이 가능함 = projection을 해야함 = select절에 올 수 있음
-- 예제2: 사원별 평균 월급은?
select emp_no, avg(salary)
from salaries
group by emp_no; -- 사원별 -> group by


-- 5) having
-- 	  집계결과(결과 테이블)에서 row를 선택하는 경우(집계된 결과를 골라낼 땐 having절 사용(where절x))
--    이미 where절은 실행이 되었기 때문에 having절에 이 조건을 주어야 한다. 
-- 예제3: 평균월급이 60000 달러 이상인 사원의 사번과 평균월급을 출력하라
select emp_no, avg(salary) as avg_salary
from salaries
group by emp_no -- groupby에 참여하는 컬럼은 select 절에 올 수 있음 
having avg_salary >= 60000;

-- 6) order by
-- 	 order by는 항상 맨 마지막 출력(project)전에 한다. 
select emp_no, avg(salary) as avg_salary
from salaries
group by emp_no 
having avg_salary >= 60000
order by avg_salary asc;

-- 주의) 사번이 10060인 사원의 사번, 평균 월급, 급여총합을 출력하세요
-- select에 사번 10060을 위해 emp_no을 추출하는건 의미적으로 맞지만, 문법적으로 오류
select emp_no, avg(salary), sum(salary) -- where절에 의해 골라낸 컬럼은 select에 오는 의미x, 이미 10060 사번을 가져온 것 -> mariadb는 에러가 안나지만, oracle/postgresql은 에러남. 
from salaries
where emp_no = 10060;

-- 문법적으로 옳은 경우 
select emp_no, avg(salary), sum(salary) 
from salaries
group by emp_no
having emp_no = '10060';