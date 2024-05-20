select count(*)
from employees a
join salaries b on a.emp_no = b.emp_no
where b.to_date = '9999-01-01'
	and b.salary > (select avg(salary) avg_salary
						from salaries
						where to_date = '9999-01-01');