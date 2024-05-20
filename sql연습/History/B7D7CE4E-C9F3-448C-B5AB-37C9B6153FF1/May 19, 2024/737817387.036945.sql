select first_name,
		hire_date,
		period_diff(date_format(curdate(), '%y%m'), date_format(hire_date, '%y%m')) -- 큰 날짜 
from employees;