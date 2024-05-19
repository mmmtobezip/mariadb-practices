select a.emp_no, concat(a.first_name, ' ', a.last_name)
     from employees a, titles b
    where a.emp_no = b.emp_no
      and b.title = 'Technique Leader'
      and b.to_date <> '9999-01-01';