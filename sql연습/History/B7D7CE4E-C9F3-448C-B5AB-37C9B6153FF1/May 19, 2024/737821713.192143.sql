select a.emp_no, a.salary
from salaries a
join titles b on a.emp_no = b.emp_no
where b.title = 'Engineer' 
	and a.to_date like '9999%' 
    and b.to_date like '9999%'
	and a.salary >= 40000
order by a.salary desc;