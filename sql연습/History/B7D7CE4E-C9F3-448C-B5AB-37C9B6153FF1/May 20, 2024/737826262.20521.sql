select e.dept_name '부서 이름', a.first_name '사원 이름', d.salary '사원 연봉', c.first_name as '매니저 이름', c.salary as '매니저 연봉'
from employees a
join dept_emp b on a.emp_no = b.emp_no
join (select a.emp_no, a.dept_no, b.salary, c.first_name
		from dept_manager a
		join salaries b on a.emp_no = b.emp_no
		join employees c on a.emp_no = c.emp_no
		where a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01') c on b.dept_no = c.dept_no
join salaries d on a.emp_no = d.emp_no
join departments e on b.dept_no = e.dept_no
where b.to_date = '9999-01-01'
	and d.to_date = '9999-01-01'
	and d.salary > c.salary
order by c.salary;