select count(emp_no) as '여직원'
from employees
where gender = 'F';
select count(emp_no) as '남직원'
from employees 
where gender = 'M';