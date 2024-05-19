select a.emp_no, a.first_name, b.salary
from employees a
join salaries b on a.emp_no = b.emp_no
join dept_emp c on a.emp_no = c.emp_no
join (select b.dept_no, avg(a.salary) as 'avg_salary'
		from salaries a
		join dept_emp b on a.emp_no = b.emp_no
		where a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
		group by b.dept_no) d on d.dept_no = c.dept_no
where b.to_date = '9999-01-01'
	and c.to_date = '9999-01-01'
	and b.salary > d.avg_salary;