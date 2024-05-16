--
-- inner join
--

-- 예제1: 현재, 근무하고 있는 직원의 이름과 직책을 모두 출력하시오.
select *
from employees, titles
where employees.emp_no = titles.emp_no -- join 조건(n-1)
	and titles.to_date = '9999-01-01'; -- row 선택 조건 

-- 예제2: 현재, 근무하고 있는 직원의 이름과 직책을 모두 출력하되, 여성 엔지니어(Engineer)만 출력하시오
select a.emp_no, a.first_name, b.title
from employees as a , titles as b
where a.emp_no = b.emp_no 			-- join 조건(n-1)
	and b.to_date = '9999-01-01' 	-- row 선택 조건1 
    and a.gender = 'f'  			-- row 선택 조건2
    and b.title = 'Engineer'; 		-- row 선택 조건3
    
    
-- 
-- ANSI/ISO SQL1999 JOIN 표준문법
--

-- 1) natural join
-- : 조인 대상이 되는 두 테이블에 이름이 같은 공통 컬림이 있으면, 조인 조건을 명시하지 않고 암묵적으로 조인이 된다. 
select a.first_name, b.title
from employees a natural join titles b
where b.to_date = '9999-01-01';

-- 2)join ~ using
-- : natural join 문제점 해결을 위해 나옴(의도하지 않은 컬럼도 엮이는 경우)

-- 2-1) before using natural join
select count(*)
from salaries a natural join titles b
where a.to_date = '9999-01-01' -- 현재 근무하는 직원 중 타이틀이 바뀌며 연봉이 올라간..사람 찾기? 조인이 아님 
	and b.to_date = '9999-01-01'; 

-- 2-2) after using join ~ using 
select count(*)
from salaries a join titles b using(emp_no)
where a.to_date = '9999-01-01' 
	and b.to_date = '9999-01-01';

-- 3) join ~ on
-- 예제3: 현재, 직책별 평균 연봉을 큰 순서대로 출력 하세요.
select a.title, avg(b.salary)
from titles a join salaries b on a.emp_no = b.emp_no
where a.to_date = '9999-01-01' and b.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) desc;

-- 실습문제 1 
-- 현재, 직원별 근무 부서를 출력해 보세요.
-- 사번, 직원이름(first_name), 부서명 순으로 출력하세요.
select a.emp_no, a.first_name, b.dept_name
from employees a, departments b, dept_emp c
where a.emp_no = c.emp_no
	and b.dept_no = c.dept_no
    and c.to_date like '9999-%';

-- 실습문제2
-- 현재, 지급되고 있는 급여를 출력해 보세요.
-- 사번, 이름, 급여 순으로 출력
select a.emp_no, a.first_name, b.salary
from employees as a, salaries as b
where a.emp_no = b.emp_no
	and b.to_date = '9999-01-01';

-- 실습문제3
-- 현재, 직책별 평균연봉과 직원수를 구하되 직원 수가 100명 이상인 직책만 출력하세요.
-- projection: 직책 평균연봉 직원수 
select a.title, avg(b.salary), count(*)
from titles a, salaries b
where a.emp_no = b.emp_no
	and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
group by a.title -- 직책별 그룹 만들기
	having count(*) >= 100;
    
-- 실습문제4
-- 현재, 부서별로 직책이 Engineer인 직원인 직원들에 대한 평균 연봉을 구하세요.
-- projection: 부서이름 | 평균급여 
-- 실패작 
select b.dept_name as 부서, avg(c.salary) as 평균연봉
from titles a, salaries c, departments b,  dept_emp d -- 부서: departments.dept_name / 직책: titles.title(engineer) / 급여 salary
where a.emp_no = c.emp_no
	and d.emp_no = a.emp_no
    and d.dept_no = b.dept_no
	and a.to_date = '9999-01-01'
	and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
group by b.dept_name
	having a.title = 'Engineer';

select a.dept_name as 부서이름, avg(c.salary) as 평균연봉
from departments a, titles b, salaries c, dept_emp d -- dept_no을 연결하기 위한 중간 역할 'dept_emp'
where a.dept_no = d.dept_no
	and d.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and d.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and b.title = 'Engineer'
group by a.dept_name
order by 평균연봉 desc;
    
