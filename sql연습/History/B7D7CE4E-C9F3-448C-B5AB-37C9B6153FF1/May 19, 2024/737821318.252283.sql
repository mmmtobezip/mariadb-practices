select a.emp_no, concat(a.first_name, ' ', a.last_name) as '이름'
from employees a
join titles b on a.emp_no = b.emp_no
where b.title = 'technique Leader' and b.to_date not like '9999%';