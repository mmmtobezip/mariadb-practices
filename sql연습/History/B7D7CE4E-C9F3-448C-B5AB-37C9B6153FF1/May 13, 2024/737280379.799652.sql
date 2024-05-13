select count(emp_no) as 현재 직원 수
from salaries
where to_date like '9999-%';