select a.emp_no, a.last_name, c.dept_name
from employees a
join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where b.to_date like '9999%'
order by a.last_name asc;