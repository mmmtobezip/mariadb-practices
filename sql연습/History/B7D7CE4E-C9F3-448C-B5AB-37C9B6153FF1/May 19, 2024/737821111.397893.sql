select a.emp_no, a.last_name, b.salary, e.title, d.dept_name
from employees a
join salaries b on a.emp_no = b.emp_no
join dept_emp c on a.emp_no = c.emp_no
join departments d on c.dept_no = d.dept_no
join titles e on a.emp_no = e.emp_no
where b.to_date like '9999%'
	and e.to_date like '9999%'
    and c.to_date like '9999%'
order by a.last_name asc;