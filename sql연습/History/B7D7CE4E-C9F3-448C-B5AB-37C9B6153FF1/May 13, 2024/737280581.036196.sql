select count(*) as 현재 직원 수
from salaries
-- where to_date = '9999-01-01';
where to_date like '9999-%';