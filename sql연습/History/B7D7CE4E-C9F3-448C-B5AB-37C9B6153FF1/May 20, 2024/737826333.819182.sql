select  d.dept_name '부서명', concat(e.first_name,' ',e.last_name) '사원이름', s.salary '연봉', concat(nt.name) as '매니저 이름',nt.salary as '매니저 연봉'
from employees e
inner join dept_emp de on e.emp_no = de.emp_no and de.to_date >= now()
inner join departments d on d.dept_no = de.dept_no
inner join salaries s on e.emp_no = s.emp_no and s.to_date >= now()
inner join (
	select dm2.dept_no, concat(e2.first_name, ' ', e2.last_name) as 'name', s2.salary
    from employees e2
    inner join dept_manager dm2 on e2.emp_no = dm2.emp_no and dm2.to_date >= now()
    inner join salaries s2 on s2.emp_no = dm2.emp_no and s2.to_date >= now()
) nt on nt.dept_no = d.dept_no and s.salary > nt.salary;