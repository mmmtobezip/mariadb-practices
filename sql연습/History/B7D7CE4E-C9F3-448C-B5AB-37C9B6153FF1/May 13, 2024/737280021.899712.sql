-- 문제2. 
-- 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 
-- 출력은 이름, 성별,  입사일 순서이고 “이름”, “성별”, “입사일"로 컬럼 이름을 대체해 보세요.
-- 이름 > 성별 > 입사일 + as 쓰기 
SELECT first_name as '이름', gender as '성별', hire_date as '입사일'
from employees

-- 문제3.
-- 여직원과 남직원은 각 각 몇 명이나 있나요?
-- 여직원 남직원 출력 > count함수 > 각각 여직원/남직원 카운트 되게 쿼리 2개로 
-- 10   20 
select count(gender)
from employees
where gender = 'F';