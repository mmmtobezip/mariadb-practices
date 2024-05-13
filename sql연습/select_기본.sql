--
-- select 예제
--

-- 예제1: departments 테이블의 모든 데이터 출력
select * from departments;

-- 프로젝션(projection)
-- 예제2: employees 테이블에서 직원의 이름, 성별, 입사일 출력 
select first_name, gender, hire_date
from employees;

-- 프로젝션(projection)
-- 예제2-1: employees 테이블에서 직원의 이름, 성별, 입사일 출력 - limit
select first_name, gender, hire_date
from employees limit 0, 100; -- oracle에는 limit x

-- as(alias, 생략 가능)
-- 예제3: employees 테이블에서 직원의 이름, 성별, 입사일 출력 
select first_name as '이름', 
		gender as '성별',
        hire_date as '입사일'
from employees;

-- 문자열 연결: concat()
select concat('hello', ' ', ' world') 
from dual;

select concat(first_name, ' ' , last_name) as '이름',
		gender as '성별',
        hire_date as '입사일'
from employees;

-- 예제4: titles 테이블에서 모든 직급의 이름 출력
select title
from titles;

-- distinct
-- 예제4: titles 테이블에서 직급은 어떤 것들이 있는지 직급 이름 한 번씩만 출력
select distinct(title)
from titles;


-- 
-- where 예제
-- 

-- 비교 연산자
-- 예제1: employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일 출력 
select concat(first_name, ' ' , last_name) as '이름',
		gender as '성별',
        hire_date as '입사일'
from employees
where hire_date < '1991-01-01'
order by hire_date desc;

-- 논리 연산자
-- 예제2: employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력 
select concat(first_name, ' ' , last_name) as '이름',
		gender as '성별',
        hire_date as '입사일'
from employees
where hire_date < '1989-01-01' and gender = 'F';

-- in(=or) 연산자
-- 예제3: dept_emp 테이블에서 부서 번호가 d005, d009에 속한 사원의 사번, 부서번호 출력 
select  emp_no, dept_no
from dept_emp
where dept_no = 'd005' or dept_no = 'd009';

select emp_no, dept_no
from dept_emp
where dept_no in ('d005', 'd009');

-- like 검색 
-- 예제4: employees 테이블에서 1989년에 입사한 직원의 이름, 입사일 출력 
select first_name, hire_date
from employees
where '1989-01-01' <= hire_date <= '1989-12-31';

select first_name, hire_date
from employees
where '1989-01-01' <= hire_date and hire_date <= '1989-12-31';

select first_name, hire_date
from employees
where hire_date between '1989-01-01' and '1989-12-31';

select first_name, hire_date
from employees
where hire_date like '1989-%';

--
-- order by 예제
-- order by c1 asc, c2 desc;
--

-- 예제1: employees 테이블에서 직원의 전체이름, 성별 , 입사일을 입사일 순으로 출력 
select concat(first_name, ' ' , last_name) as '이름',
		gender as '성별',
        hire_date as '입사일'
from employees
order by hire_date; -- 기본 오름차순(asc, 생략 가능)

-- 예제2: salaries 테이블에서 2001년 월급이 가장 높은순으로 사번, 월급순 출력
select salary, emp_no, from_date, to_date
from salaries 
where from_date like '2001%' or to_date like '2001%' 
order by salary desc;

-- 예제3: 남자 직원의 이름, 성별, 입사일을 입사일순(선임순)으로 출력
select first_name, gender, hire_date
from employees
where gender = 'M'
order by hire_date asc;

-- 예제4: 직원의 사번, 월급을 사번(asc), 월급(desc)
select emp_no, salary
from salaries 
order by emp_no asc, salary desc;
