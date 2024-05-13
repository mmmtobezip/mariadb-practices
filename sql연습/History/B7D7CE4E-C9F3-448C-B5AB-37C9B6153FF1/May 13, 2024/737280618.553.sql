-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
-- salaries에서 count, where to_date = 9999-01-01 
-- 현재: 9999-01-01 
select count(*) as '현재 사원 수'
from salaries
where to_date like '9999-%';