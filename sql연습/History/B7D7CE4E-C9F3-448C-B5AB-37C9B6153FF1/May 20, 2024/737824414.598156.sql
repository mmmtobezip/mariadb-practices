select a.emp_no, a.first_name, d.first_name as 'manager_name', c.dept_name
from employees a
join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
join (select a.dept_no, a.emp_no, b.first_name
		from dept_manager a
		join employees b on a.emp_no = b.emp_no
		where to_date = '9999-01-01') d on b.dept_no = d.dept_no
where b.to_date = '9999-01-01';