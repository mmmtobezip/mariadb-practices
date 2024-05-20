select a.title, avg(b.salary)
from titles a
join salaries b on a.emp_no = b.emp_no
where a.to_date like '9999%'
	and b.to_date like '9999%'
group by a.title
order by avg(b.salary) desc;