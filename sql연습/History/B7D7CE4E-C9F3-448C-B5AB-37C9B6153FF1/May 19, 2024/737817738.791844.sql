select date_format(curdate(),'%Y') - date_format(max(birth_date),'%Y'),
       date_format(curdate(),'%Y') - date_format(min(birth_date),'%Y')
  from employees;