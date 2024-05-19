select max(salary), min(salary) 
  from salaries
 where to_date='9999-01-01';