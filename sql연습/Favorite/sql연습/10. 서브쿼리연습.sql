--
-- subquery
--


--
-- 1) select절, insert into t1 values(..)
--
select(select 1+2 from dual) from dual;

--
-- 2) from절 (select의 select)
--

select a.* from (select 1+2 from dual) a; -- 서브쿼리에 이름을 지정해야함(e.g. 'a')
select now() as n, sysdate() as s, 3+1 as r from dual;
select n, s, r
	from (select now() as n, sysdate() as s, 3+1 as r from dual) a; -- select결과를 from절에 넣어 하나의 테이블로 봄 

-- 서브쿼리 자체는 select에 많다. (물론 insert문에서도 가능) 
-- 3) where절 (select의 select)
--

-- 예제1) 현재, Fai Bale이 근무하는 부서에서 근무하고 있는 다른 직원의 사번과 이름을 출력하시오.
-- 직원의 사번과 이름은 emplyess에서 뽑고,  fai bale이 근무하는 부서를 뽑아야함. 

-- 서브쿼리가 아닌 각각 구하는 과정 
select b.dept_no -- 다른 직원의 사번 뽑음 
from employees a, dept_emp b 
where a.emp_no = b.emp_no -- join을 통해 하나의 큰 테이블이 만들어짐. 
	and b.to_date = '9999-01-01' -- 현재 조건 충족
    and concat(a.first_name, ' ', a.last_name) = 'Fai Bale';

select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
    and b.dept_no = 'd004'; -- 위 쿼리에서 뽑은 부서 번호로 찾음 
    
-- 서브 쿼리로 만든 답 
select a.emp_no, a.first_name
from employees a, dept_emp b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
    and b.dept_no = (
			select b.dept_no 
				from employees a, dept_emp b 
				where a.emp_no = b.emp_no 
				and b.to_date = '9999-01-01' 
				and concat(a.first_name, ' ', a.last_name) = 'Fai Bale'
	);
-- 현재 위 서브쿼리 결과는 한개의 row에 한개의 column이 나와서 where절에 '='를 통해 나타낼 수 있었지만, 만약 컬럼이 두개 나오는경우?
-- dept_no하나만을 써서 비교할 수 없음. '=' 같은 연산자에 따라 컬럼값이 한개, 여러개 올 수 있는 경우가 나뉨. 
-- e.g. 'in' 연산자는 뒤에 오는 값이 여러개여도 됨. in 자체가 포함하는 게 하나만 있어도 되니까 멀티로 나와도됨. 


-- 3-1) 단일행 연산자(비교 연산자에서 주로 쓰임): =, >, <, =>, <=, <>, != 
-- 실습문제1
-- 현재, 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름과 급여를 출력하시오.
select avg(salary)
from salaries
where to_date = '9999-01-01';

select a.first_name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
	and b.salary < (select avg(salary)
					from salaries
                    where to_date = '9999-01-01')
order by b.salary desc;

-- 실습문제2 
-- 현재, 직책별 평균급여 중에 가장 작은 직책과 평균 급여를 출력해 보시오. 
-- 평균연봉을 직책별로 구하고, 그중 가장 평균 연봉이 낮은 직책과 그 직책의 연봉을 출력하면 됨.
-- 1) 직책별 평균 급여 구하고
select a.title, avg(b.salary)
from titles a, salaries b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
	and a.to_date = '9999-01-01'
group by a.title;
-- 2) 직책별 가장 적은 평균 급여 구하고(1번을 from절에 넣기)
select min(avg_salary)  -- 집계함수랑 다른 컬럼 같이 쓸 수 x(즉, a.title 불가)
	from(select a.title, avg(b.salary) as avg_salary
			from titles a, salaries b
			where a.emp_no = b.emp_no
				and b.to_date = '9999-01-01'
				and a.to_date = '9999-01-01'
			group by a.title) a;

-- 3) 방법1: subquery - where절 합치기(2번을 where절에 넣기)
select a.title, avg(b.salary)
from titles a, salaries b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
	and a.to_date = '9999-01-01'
group by a.title
	having avg(b.salary) = (select min(avg_salary) -- where절을 지났으니 having으로 서브쿼리 넣어줘야함
								from(select a.title, avg(b.salary) as avg_salary
									from titles a, salaries b
									where a.emp_no = b.emp_no
									and b.to_date = '9999-01-01'
									and a.to_date = '9999-01-01'
									group by a.title) a);
-- 3) 방법2: top-k(limit), order by 선행 필수 
select a.title, avg(b.salary)
from titles a, salaries b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01'
	and a.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) asc
	limit 0, 1;-- offset: 0번째 인덱스 = 가장 작은 인덱스 선택, 페이징 처리시 많이 사용 
    
-- 3-2) 복수행 연산자: in, not in, 비교연산자any(e.g. <any), 비교연산자all(e.g =all)

-- any 사용법
-- 1. =any: in
-- 2. >any, >=any: 최소값
-- 3. <any, <=any: 최대값
-- 4. <>any, !=any: not in

-- all 사용법
-- 1. =all: (x) 
-- 2. >all, a>=all: 최대값 
-- 3. <all, <=all: 최소값 
-- 4. <>all, !=all 

-- 실습문제3
-- 현재, 급여가 50000이상인 직원의 이름과 급여를 출력하시오.
-- 둘리 60000
-- 또치 40000 

-- 방법1) join
select a.salary, b.first_name
from salaries a, employees b
where a.emp_no = b.emp_no
	and a.to_date = '9999-01-01'
	and a.salary > 50000
order by a.salary asc;

-- 방법2) subquery: where(in연산자)
select emp_no, salary
from salaries
where to_date = '9999-01-01'
	and salary > 50000;
    
-- 현재 직원들의 월급 출력 
select a.first_name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
	and b.to_date like '9999-%'
    and (a.emp_no, b.salary) in (select emp_no, salary
									from salaries
									where to_date = '9999-01-01'
									and salary > 50000) -- 멀티컬럼 & 멀티로우 = in 연산자 사용
order by b.salary asc;

-- 방법3) subquery: where(=any) 
select a.first_name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
	and b.to_date like '9999-%'
    and (a.emp_no, b.salary) =any (select emp_no, salary
									from salaries
									where to_date = '9999-01-01'
									and salary > 50000)
order by b.salary asc;

-- 실습문제4 
-- 현재, 각 부서별로 최고 급여를 받고 있는 직원의 부서, 이름과 월급을 출력하시오. 
-- 출력 포멧: 총무 둘리 40000
--          영업 마이콜 50000
-- 방법1) subquery(where절 - in)

-- 부서별 최고 연봉 구하기
select max(a.salary), b.dept_no
from salaries a, dept_emp b
where a.emp_no = b.emp_no
	and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
group by b.dept_no;

-- select a.first_name, avg_salary
-- from employees a, salaries b
-- where a.emp_no = b.emp_no
-- 	and b.to_date = '9999-01-01'
--     and (a.emp_no, b.salary) in (select max(a.salary) as avg_salary, b.dept_no
-- 									from salaries a, dept_emp b
-- 									where a.emp_no = b.emp_no
-- 										and a.to_date = '9999-01-01'
-- 								);
                                
select c.first_name, a.dept_name, d.salary
from departments a, 
	dept_emp b, 
    employees c, 
    salaries d
where a.dept_no = b.dept_no
	and b.emp_no = c.emp_no
    and c.emp_no = d.emp_no
    and b.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and (b.dept_no, d.salary) in (select max(a.salary), b.dept_no
									from salaries a, dept_emp b
									where a.emp_no = b.emp_no
										and a.to_date = '9999-01-01'
										and b.to_date = '9999-01-01'
									group by b.dept_no);

-- 방법2) subquery(from절) & join 서브쿼리 결과를 테이블로 취급하고 join
select c.first_name, a.dept_name, d.salary
from departments a, 
	dept_emp b, 
    employees c, 
    salaries d,
    (select max(a.salary) as max_salary, b.dept_no
		from salaries a, dept_emp b
		where a.emp_no = b.emp_no
			and a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
		group by b.dept_no) e -- 부서별 max데이터를 넣고 = 연산 쓰면됨?
where a.dept_no = b.dept_no
	and b.emp_no = c.emp_no
    and c.emp_no = d.emp_no
    and b.dept_no = e.dept_no
    and b.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and d.salary = e.max_salary;