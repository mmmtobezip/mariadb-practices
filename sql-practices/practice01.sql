-- 기본 SQL 문제입니다.

-- 문제1.
-- 사번이 10944인 사원의 이름은(전체 이름)
-- 전체이름 concat 출력 

-- 문제2. 
-- 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 
-- 출력은 이름, 성별,  입사일 순서이고 “이름”, “성별”, “입사일"로 컬럼 이름을 대체해 보세요.
-- 이름 > 성별 > 입사일 + as 쓰기 

-- 문제3.
-- 여직원과 남직원은 각 각 몇 명이나 있나요?
-- 여직원 남직원 출력 > count함수 > 각각 여직원/남직원 카운트 되게 쿼리 2개로 
-- 10   20 

-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
-- salaries에서 count, where to_date = 9999-01-01 
-- 현재: 9999-01-01 

-- 문제5.
-- 부서는 총 몇 개가 있나요?
-- department tables
select count(dept_no)
from departments;

-- 문제6.
-- 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
-- dept_manager tables, to_date = 9999-01-01 
-- 역임 매니저 제외 = 현재 매니저는 몇명인가 ? 

-- 문제7.
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
-- departments tables, order by length() 
select dept_name
from departments
order by length(dept_name) desc;

-- 문제8.
-- 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
-- salary tables, count 

-- 문제9.
-- 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.
-- distinct, 

-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
-- 

-- 문제11
-- 사번이 13250(Zeydy)인 지원의 직책 변경 상황을 시간순으로 출력해보세요.
-- 직책 테이블에 zeydy 뽑고 order by 최근순으로 직책 출력 departmentsdepartmentstitlesemp_nodepartments
