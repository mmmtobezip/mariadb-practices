select c.dept_name, avg(a.salary)
from salaries a
join dept_emp b on a.emp_no = b.emp_no
join departments c on b.dept_no = c.dept_no
where a.to_date = '9999-01-01'
	and b.to_date = '9999-01-01'
group by b.dept_no
order by avg(a.salary) desc
limit 0, 1;