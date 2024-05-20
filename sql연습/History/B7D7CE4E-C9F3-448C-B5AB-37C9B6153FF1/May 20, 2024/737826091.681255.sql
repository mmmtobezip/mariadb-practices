select a.title, avg(b.salary)
from titles a
join salaries b on a.emp_no = b.emp_no
where a.to_date = '9999-01-01'
	and b.to_date = '9999-01-01'
group by a.title
order by avg(b.salary) desc
limit 0, 1;