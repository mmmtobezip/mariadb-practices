-- 문제6.
-- 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
-- dept_manager tables, to_date = 9999-01-01 
-- 역임 매니저 제외 = 현재 매니저는 몇명인가 ? 
select count(*) as '부서 매니저'
from dept_manager
where to_date like '9999-%';