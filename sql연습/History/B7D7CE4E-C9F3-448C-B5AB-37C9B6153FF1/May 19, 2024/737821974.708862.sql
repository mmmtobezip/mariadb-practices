select b.title, avg(a.salary)
from salaries a
join titles b on a.emp_no = b.emp_no
where a.to_date like '9999%' and b.to_date like '9999%'
group by b.title
having avg(a.salary) >= 50000
order by avg(a.salary) desc;