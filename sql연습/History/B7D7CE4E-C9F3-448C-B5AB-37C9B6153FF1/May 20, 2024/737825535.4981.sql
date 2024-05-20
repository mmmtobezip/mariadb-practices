select a.emp_no, a.first_name, b.title, c.salary
from employees a
join titles b on a.emp_no = b.emp_no
join salaries c on a.emp_no = c.emp_no
join dept_emp d on a.emp_no = d.emp_no
join (select b.dept_no, avg(a.salary) as 'avg_salary'
		from salaries a
		join dept_emp b on a.emp_no = b.emp_no
		where a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
		group by b.dept_no
		order by avg_salary desc
		limit 0, 1) e on d.dept_no = e.dept_no
where b.to_date = '9999-01-01'
	and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
	and d.dept_no = e.dept_no
order by c.salary asc;