select a.emp_no, concat(a.first_name, ' ', a.last_name), c.dept_name
     from employees a, dept_emp b, departments c
    where a.emp_no = b.emp_no
      and b.dept_no = c.dept_no
      and b.to_date = '9999-01-01'
 order by a.first_name asc;