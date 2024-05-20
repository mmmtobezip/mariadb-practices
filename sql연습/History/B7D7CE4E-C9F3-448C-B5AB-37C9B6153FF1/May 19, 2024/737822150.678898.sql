select a.dept_name, avg(c.salary)
from departments a
join dept_emp b on a.dept_no = b.dept_no
join salaries c on b.emp_no = c.emp_no
where b.to_date like '9999%' and c.to_date like '9999%'
group by a.dept_name
order by avg(c.salary) desc;