select floor(min(period_diff(date_format(now(), '%Y%m'), date_format(birth_date, '%Y%m'))) / 12) '어린 사원',
	   floor(max(period_diff(date_format(now(), '%Y%m'), date_format(birth_date, '%Y%m'))) / 12) '최연장자'
from employees;