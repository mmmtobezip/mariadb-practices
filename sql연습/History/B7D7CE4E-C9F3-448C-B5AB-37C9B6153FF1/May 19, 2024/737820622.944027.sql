select a.emp_no, a.last_name, b.dept_name
from employees a
join dept_emp c on a.emp_no = c.emp_no
join departments b on b.dept_no = c.dept_no
where c.to_date like '9999%'
order by a.last_name asc;